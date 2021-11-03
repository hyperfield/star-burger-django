# Generated by Django 3.2 on 2021-11-03 16:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('foodcartapp', '0041_remove_orderitem_order'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitem',
            name='order',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.PROTECT, related_name='orders', to='foodcartapp.order'),
            preserve_default=False,
        ),
        migrations.RemoveField(
            model_name='order',
            name='order_items',
        ),
        migrations.AddField(
            model_name='order',
            name='order_items',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.PROTECT, related_name='ordered_items', to='foodcartapp.orderitem', verbose_name='элементы заказа'),
            preserve_default=False,
        ),
    ]
