# Generated by Django 3.2 on 2021-12-09 07:40

from django.db import migrations


class Migration(migrations.Migration):
    def tranfser_prices(apps, schema_editor):
        OrderItem = apps.get_model('foodcartapp', 'OrderItem')
        order_items = OrderItem.objects.all()

        # for order_item in OrderItem.objects.all():
        #     order_item.price = order_item.product.price
        #     order_item.save()

        # OrderItem.objects.all().update(price="product__price")

        if order_items.exists():
            for order_item in order_items.iterator():
                order_item.price = order_item.product.price
                order_item.save()

    dependencies = [
        ('foodcartapp', '0051_auto_20211209_0739'),
    ]

    operations = [
        migrations.RunPython(tranfser_prices),
    ]
