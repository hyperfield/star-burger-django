import json

from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils import timezone


class Restaurant(models.Model):
    name = models.CharField(
        'название',
        max_length=50
    )
    address = models.CharField(
        'адрес',
        max_length=100,
        blank=True,
    )
    contact_phone = models.CharField(
        'контактный телефон',
        max_length=50,
        blank=True,
    )

    class Meta:
        verbose_name = 'ресторан'
        verbose_name_plural = 'рестораны'

    def __str__(self):
        return self.name


class ProductQuerySet(models.QuerySet):
    def available(self):
        products = (
            RestaurantMenuItem.objects
            .filter(availability=True)
            .values_list('product')
        )
        return self.filter(pk__in=products)


class ProductCategory(models.Model):
    name = models.CharField(
        'название',
        max_length=50
    )

    class Meta:
        verbose_name = 'категория'
        verbose_name_plural = 'категории'

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(
        'название',
        max_length=50
    )
    category = models.ForeignKey(
        ProductCategory,
        verbose_name='категория',
        related_name='products',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
    )
    price = models.DecimalField(
        'цена',
        max_digits=8,
        decimal_places=2,
        validators=[MinValueValidator(0)]
    )
    image = models.ImageField(
        'картинка'
    )
    special_status = models.BooleanField(
        'спец.предложение',
        default=False,
        db_index=True,
    )
    description = models.TextField(
        'описание',
        max_length=200,
        blank=True,
    )

    objects = ProductQuerySet.as_manager()

    class Meta:
        verbose_name = 'товар'
        verbose_name_plural = 'товары'

    def __str__(self):
        return self.name


class RestaurantMenuItem(models.Model):
    restaurant = models.ForeignKey(
        Restaurant,
        related_name='menu_items',
        verbose_name="ресторан",
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='menu_items',
        verbose_name='продукт',
    )
    availability = models.BooleanField(
        'в продаже',
        default=True,
        db_index=True
    )

    class Meta:
        verbose_name = 'пункт меню ресторана'
        verbose_name_plural = 'пункты меню ресторана'
        unique_together = [
            ['restaurant', 'product']
        ]

    def __str__(self):
        return f"{self.restaurant.name} - {self.product.name}"


class OrderQuerySet(models.QuerySet):
    def with_total_amounts(self):
        total_amounts = self.annotate(
            total_amount=models.Sum(models.F("order_items__price")
                                    * models.F("order_items__quantity"))
            )
        return total_amounts


class Order(models.Model):
    ORDER_STATUSES = (
        ("pending", "Необработанный"),
        ("processing", "В обработке"),
        ("completed", "Завершён"),
        ("cancelled", "Отменён"),
    )

    PAYMENT_METHODS = (
        ("cash", "Наличностью"),
        ("electronic", "Электронно"),
    )

    firstname = models.CharField(max_length=20, verbose_name="имя")
    lastname = models.CharField(max_length=20, verbose_name="фамилия")
    phonenumber = PhoneNumberField(verbose_name="телефон", db_index=True)
    address = models.CharField(max_length=200, verbose_name="адрес")
    status = models.CharField(max_length=10, choices=ORDER_STATUSES,
                              default="pending", db_index=True)
    payment_method = models.CharField(max_length=20,
                                      choices=PAYMENT_METHODS,
                                      default="cash",
                                      verbose_name="Способ оплаты",
                                      db_index=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.PROTECT,
                                   related_name="orders", null=True,
                                   verbose_name="Ресторан")
    comment = models.TextField(
        max_length=300, blank=True, verbose_name="комментарий"
        )
    registered_at = models.DateTimeField(default=timezone.now, db_index=True)
    called_at = models.DateTimeField(null=True, blank=True, db_index=True)
    delivered_at = models.DateTimeField(null=True, blank=True, db_index=True)

    objects = OrderQuerySet.as_manager()

    class Meta:
        verbose_name = 'заказ'
        verbose_name_plural = 'заказы'

    def set_order_items(self, order_items):
        self.order_items = json.dumps(order_items)

    def get_order_items(self):
        return json.loads(self.order_items)

    def __str__(self):
        return f"{self.firstname} {self.lastname}, {self.address}"


class OrderItem(models.Model):
    order = models.ForeignKey('Order', on_delete=models.CASCADE,
                              related_name="order_items",
                              null=True, blank=True,
                              verbose_name="Ассоциированный заказ")
    product = models.ForeignKey(Product,
                                on_delete=models.PROTECT,
                                related_name="products",
                                verbose_name="продукты")
    quantity = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(10)],
                                   verbose_name="Количество")
    price = models.DecimalField(max_digits=7, decimal_places=2,
                                validators=[MinValueValidator(0)],
                                verbose_name="цена")


    class Meta:
        verbose_name = 'элемент заказа'
        verbose_name_plural = 'элементы заказов'

    def __str__(self):
        return f"{self.product}, qty: {self.quantity}"
