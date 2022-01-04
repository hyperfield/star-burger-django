from django.contrib import admin

from .models import Location


@admin.register(Location)
class OrderItemInline(admin.ModelAdmin):
    model = Location
