# Generated by Django 3.2 on 2021-09-28 16:56

import django.core.validators
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('foodcartapp', '0038_order'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='products',
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(10)])),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, related_name='products', to='foodcartapp.product', verbose_name='продукты')),
            ],
        ),
        migrations.AddField(
            model_name='order',
            name='order_items',
            field=models.ManyToManyField(related_name='ordered_items', to='foodcartapp.OrderItem', verbose_name='наименования заказа'),
        ),
    ]
