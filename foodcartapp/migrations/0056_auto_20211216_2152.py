# Generated by Django 3.2 on 2021-12-16 21:52

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('foodcartapp', '0055_auto_20211216_2142'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='called_at',
            field=models.DateTimeField(db_index=True, null=True),
        ),
        migrations.AlterField(
            model_name='order',
            name='delivered_at',
            field=models.DateTimeField(db_index=True, null=True),
        ),
        migrations.AlterField(
            model_name='order',
            name='registered_at',
            field=models.DateTimeField(db_index=True, default=django.utils.timezone.now),
        ),
    ]