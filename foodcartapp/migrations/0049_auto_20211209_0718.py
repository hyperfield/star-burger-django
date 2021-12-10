# Generated by Django 3.2 on 2021-12-09 07:18

from django.db import migrations


def tranfser_prices(apps, schema_editor):
    OrderItem = apps.get_model('foodcartapp', 'OrderItem')

    for order_item in OrderItem.objects.all():
        order_item.price = order_item.product.price
        order_item.save()


class Migration(migrations.Migration):

    dependencies = [
        ('foodcartapp', '0048_auto_20211123_2010'),
    ]

    operations = [
        migrations.RunPython(tranfser_prices),
    ]
