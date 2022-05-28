from django.db import models
from django.utils import timezone


class Location(models.Model):
    address = models.CharField(
        'адрес',
        max_length=100,
        unique=True,
    )
    latitude = models.FloatField(
      'широта',
      blank=True, null=True,
    )
    longitude = models.FloatField(
      'долгота',
      blank=True, null=True,
    )
    created_on = models.DateField(
      'дата запроса',
      default=timezone.now,
    )

    class Meta:
        verbose_name = 'geolocation'
        verbose_name_plural = 'geolocations'

    def __str__(self):
        return self.address
