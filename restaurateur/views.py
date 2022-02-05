from django import forms
from django.db.models.query import Prefetch
from django.shortcuts import redirect, render
from django.views import View
from django.urls import reverse_lazy
from django.contrib.auth.decorators import user_passes_test

from django.contrib.auth import authenticate, login
from django.contrib.auth import views as auth_views

from django.conf import settings

from foodcartapp.models import Product, Restaurant, Order, OrderItem
from geolocations.models import Location
from geopy import distance

import requests


DIST_ROUND_DIGITS = 3


class Login(forms.Form):
    username = forms.CharField(
        label='Логин', max_length=75, required=True,
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Укажите имя пользователя'
        })
    )
    password = forms.CharField(
        label='Пароль', max_length=75, required=True,
        widget=forms.PasswordInput(attrs={
            'class': 'form-control',
            'placeholder': 'Введите пароль'
        })
    )


class LoginView(View):
    def get(self, request, *args, **kwargs):
        form = Login()
        return render(request, "login.html", context={
            'form': form
        })

    def post(self, request):
        form = Login(request.POST)

        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            user = authenticate(request, username=username, password=password)
            if user:
                login(request, user)
                if user.is_staff:  # FIXME replace with specific permission
                    return redirect("restaurateur:RestaurantView")
                return redirect("start_page")

        return render(request, "login.html", context={
            'form': form,
            'ivalid': True,
        })


class LogoutView(auth_views.LogoutView):
    next_page = reverse_lazy('restaurateur:login')


def is_manager(user):
    return user.is_staff  # FIXME replace with specific permission


@user_passes_test(is_manager, login_url='restaurateur:login')
def view_products(request):
    restaurants = list(Restaurant.objects.order_by('name'))
    products = list(Product.objects.prefetch_related('menu_items'))

    default_availability = {restaurant.id: False for restaurant in restaurants}
    products_with_restaurants = []
    for product in products:

        availability = {
            **default_availability,
            **{item.restaurant_id: item.availability
               for item in product.menu_items.all()},
        }
        orderer_availability = \
            [availability[restaurant.id] for restaurant in restaurants]

        products_with_restaurants.append(
            (product, orderer_availability)
        )

    return render(request, template_name="products_list.html", context={
        'products_with_restaurants': products_with_restaurants,
        'restaurants': restaurants,
    })


@user_passes_test(is_manager, login_url='restaurateur:login')
def view_restaurants(request):
    return render(request, template_name="restaurants_list.html", context={
        'restaurants': Restaurant.objects.all(),
    })


def fetch_coordinates(apikey, address):
    base_url = "https://geocode-maps.yandex.ru/1.x"
    response = requests.get(base_url, params={
        "geocode": address,
        "apikey": apikey,
        "format": "json",
    })
    response.raise_for_status()
    found_places = \
        response.json()['response']['GeoObjectCollection']['featureMember']

    if not found_places:
        return None, None

    most_relevant = found_places[0]
    lon, lat = most_relevant['GeoObject']['Point']['pos'].split(" ")
    return lon, lat


# Intersect restaurants availability for each order_item to show only
# restaurants in which all order items are available.
def intersect_restaurants(cookable_menu_items_for_order_by_products_sets):
    if len(cookable_menu_items_for_order_by_products_sets) == 0:
        return []
    first_cookable_menu_items_for_order_by_products_set = \
        set([menu_item.restaurant for menu_item
            in cookable_menu_items_for_order_by_products_sets[0]])
    if len(cookable_menu_items_for_order_by_products_sets) <= 1:
        return first_cookable_menu_items_for_order_by_products_set

    for current_set in cookable_menu_items_for_order_by_products_sets[1:]:
        other_cookable_menu_items_for_order_by_products_set = \
            set([menu_item.restaurant for menu_item
                in current_set if menu_item.availability])
        first_cookable_menu_items_for_order_by_products_set = \
            first_cookable_menu_items_for_order_by_products_set & \
            other_cookable_menu_items_for_order_by_products_set
    return list(first_cookable_menu_items_for_order_by_products_set)


def get_coords(locations, entity_address):
    # There can be only one unique location
    latitude, longitude = None, None
    for location in locations:
        if entity_address == location.address:
            longitude, latitude = location.longitude, location.latitude
            break
    if longitude:
        return latitude, longitude
    longitude, latitude = fetch_coordinates(
        settings.YANDEX_GEOCODER_API_KEY, entity_address
        )
    if not longitude:
        return latitude, longitude

    Location.objects.create(
        address=entity_address,
        latitude=latitude,
        longitude=longitude,
        )
    return latitude, longitude


@user_passes_test(is_manager, login_url='restaurateur:login')
def view_orders(request):
    orders = Order.objects.with_total_prices().\
        prefetch_related("items__product__menu_items__restaurant")\
        .filter(status__in=["pending", "processing"])
    orders_with_restaurants = []
    needed_rest_addrs = \
        [restaurant.address for restaurant in Restaurant.objects.all()]
    needed_order_addrs = [order.address for order in orders]
    needed_addrs = needed_order_addrs + needed_rest_addrs
    needed_locations = Location.objects.filter(
                            address__in=needed_addrs
                            )
    for order in orders:
        cookable_menu_items_for_order_by_products_sets = \
            [order_item.product.menu_items.all()
                for order_item in order.items.all()]
        available_restaurants = \
            intersect_restaurants(
                cookable_menu_items_for_order_by_products_sets
                )
        rest_with_dist = []
        client_coords = None
        for restaurant in available_restaurants:
            rest_addr = restaurant.address
            rest_coords = get_coords(needed_locations, rest_addr)
            if not rest_coords:
                continue

            if not client_coords:
                client_addr = order.address
                client_coords = get_coords(needed_locations, client_addr)
                if not client_coords:
                    break

            dist_km = distance.distance(client_coords, rest_coords).km
            rest_with_dist.append(
                (restaurant, round(dist_km, DIST_ROUND_DIGITS))
                )
        rest_with_dist = sorted(rest_with_dist, key=lambda x: x[1])

        orders_with_restaurants.append((order, rest_with_dist))

    return render(request, template_name='order_items.html', context={
        "orders": orders_with_restaurants,
        "next": request.path,
    })
