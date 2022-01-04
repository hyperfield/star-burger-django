from django.contrib import admin
from django.urls import path
from django.shortcuts import redirect

from . import views

app_name = "geolocations"

urlpatterns = [
    path('admin/', admin.site.urls),
]
