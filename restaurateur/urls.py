from django.urls import path
from django.shortcuts import redirect

from . import views

app_name = "restaurateur"

urlpatterns = [
    path('', lambda request: redirect('restaurateur:ProductsView')),

    path('products/', views.view_products, name="ProductsView"),

    path('restaurants/', views.view_restaurants, name="RestaurantView"),

    # TODO заглушка для нереализованного функционала
    path('orders/', views.view_orders, name="view_orders"),

    path('login/', views.LoginView.as_view(), name="login"),
    path('logout/', views.LogoutView.as_view(), name="logout"),
]
