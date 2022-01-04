from django.db import models
from django.utils import timezone


class Location(models.Model):
    address = models.CharField(
        'адрес',
        max_length=100,
    )
    latitude = models.FloatField(
        'широта'
    )
    longitude = models.FloatField(
      'долгота'
    )
    created_on = models.DateField(
      'дата запроса',
      default=timezone.now,
    )

    class Meta:
        verbose_name = 'геолокация'
        verbose_name_plural = 'геолокации'

    def __str__(self):
        return self.address
