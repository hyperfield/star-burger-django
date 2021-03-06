# Generated by Django 3.2 on 2021-12-09 07:18

from django.db import migrations


def transfer_prices(apps, schema_editor):
    OrderItem = apps.get_model('foodcartapp', 'OrderItem')
    order_items = OrderItem.objects.all()
    for order_item in order_items.iterator():
        order_item.price = order_item.product.price
        order_item.save()


class Migration(migrations.Migration):

    dependencies = [
        ('foodcartapp', '0048_auto_20211123_2010'),
    ]

    operations = [
        migrations.RunPython(transfer_prices),
    ]
