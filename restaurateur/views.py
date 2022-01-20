from django import forms
from django.shortcuts import redirect, render
from django.views import View
from django.urls import reverse_lazy
from django.contrib.auth.decorators import user_passes_test

from django.contrib.auth import authenticate, login
from django.contrib.auth import views as auth_views

from django.conf import settings

from foodcartapp.models import Product, Restaurant, Order
from geolocations.models import Location

import requests


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
            **{item.restaurant_id: item.availability for item in product.menu_items.all()},
        }
        orderer_availability = [availability[restaurant.id] for restaurant in restaurants]

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
    found_places = response.json()['response']['GeoObjectCollection']['featureMember']

    if not found_places:
        return None

    most_relevant = found_places[0]
    lon, lat = most_relevant['GeoObject']['Point']['pos'].split(" ")
    return lon, lat


# Intersect restaurants availability for each order_item to show only
# restaurants in which all order items are available.
def intersect_restaurants(restaurants):
    initial_restaurants_entries = [_.restaurant for _ in restaurants[0]]
    if len(restaurants) <= 1:
        return initial_restaurants_entries
    for restaurants_entry in restaurants[1:]:
        other_restaurants = [_.restaurant for _ in restaurants_entry
                             if _.availability]
        for restaurant in initial_restaurants_entries:
            if restaurant not in other_restaurants:
                initial_restaurants_entries.remove(restaurant)
    return initial_restaurants_entries


def get_coords(locations, entity_with_address):
    current_coords = None
    for location in locations:
        if entity_with_address.address != location.address:
            continue
        else:
            current_coords = (location.longitude, location.latitude)
    if not current_coords:
        current_coords = fetch_coordinates(
            settings.YANDEX_GEOCODER_API_KEY, entity_with_address.address
            )
        if not current_coords:
            return current_coords
        else:
            new_location = Location.objects.create(
                address=entity_with_address.address,
                latitude=current_coords[1],
                longitude=current_coords[0],
            )
            locations.append(new_location)
    current_coords = (current_coords[1], current_coords[0])
    return current_coords


@user_passes_test(is_manager, login_url='restaurateur:login')
def view_orders(request):
    from geopy import distance
    locations = [location for location in Location.objects.all()] # To reduce queries to DB
    orders = Order.objects.with_total_prices().\
        prefetch_related("items__product__menu_items__restaurant")\
        .filter(status__in=["pending", "processing"])
    orders_with_restaurants = []
    for order in orders:
        restaurants = [order_item.product.menu_items.all()
                       for order_item in order.items.all()]

        available_restaurants = intersect_restaurants(restaurants)

        rest_with_dist = []
        for restaurant in available_restaurants:
            rest_coords = get_coords(locations, restaurant)
            if not rest_coords:
                continue

            client_coords = get_coords(locations, order)
            if not client_coords:
                break

            dist_km = distance.distance(client_coords, rest_coords).km
            rest_with_dist.append((restaurant, round(dist_km, 3)))
        rest_with_dist = sorted(rest_with_dist, key=lambda x: x[1])

        orders_with_restaurants.append((order, rest_with_dist))

    return render(request, template_name='order_items.html', context={
        "orders": orders_with_restaurants,
        "next": request.path,
    })
