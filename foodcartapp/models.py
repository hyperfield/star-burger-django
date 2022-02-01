from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils import timezone


class Restaurant(models.Model):
    name = models.CharField(
        'Название',
        max_length=50
    )
    address = models.CharField(
        'Адрес',
        max_length=100,
        blank=True,
    )
    contact_phone = models.CharField(
        'Контактный телефон',
        max_length=50,
        blank=True,
    )

    class Meta:
        verbose_name = 'Ресторан'
        verbose_name_plural = 'Рестораны'

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
        'Название',
        max_length=50
    )

    class Meta:
        verbose_name = 'Категория'
        verbose_name_plural = 'Категории'

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(
        'Название',
        max_length=50
    )
    category = models.ForeignKey(
        ProductCategory,
        verbose_name='Категория',
        related_name='products',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
    )
    price = models.DecimalField(
        'Цена',
        max_digits=8,
        decimal_places=2,
        validators=[MinValueValidator(0)]
    )
    image = models.ImageField(
        'Картинка'
    )
    special_status = models.BooleanField(
        'Спец.предложение',
        default=False,
        db_index=True,
    )
    description = models.TextField(
        'Описание',
        max_length=200,
        blank=True,
    )

    objects = ProductQuerySet.as_manager()

    class Meta:
        verbose_name = 'Товар'
        verbose_name_plural = 'Товары'

    def __str__(self):
        return self.name


class RestaurantMenuItem(models.Model):
    restaurant = models.ForeignKey(
        Restaurant,
        related_name='menu_items',
        verbose_name="Ресторан",
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='menu_items',
        verbose_name='Продукт',
    )
    availability = models.BooleanField(
        'В продаже',
        default=True,
        db_index=True
    )

    class Meta:
        verbose_name = 'Пункт меню ресторана'
        verbose_name_plural = 'Пункты меню ресторана'
        unique_together = [
            ['restaurant', 'product']
        ]

    def __str__(self):
        return f"{self.restaurant.name} - {self.product.name}"


class OrderQuerySet(models.QuerySet):
    def with_total_prices(self):
        total_prices = self.annotate(
            total_price=models.Sum(models.F("items__price")
                                   * models.F("items__quantity"))
            )
        return total_prices


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
        ("not_specified", "Не указано"),
    )

    firstname = models.CharField(max_length=20, verbose_name="Имя")
    lastname = models.CharField(max_length=20, verbose_name="Фамилия")
    phonenumber = PhoneNumberField(verbose_name="Телефон", db_index=True)
    address = models.CharField(max_length=200, verbose_name="Адрес")
    status = models.CharField(max_length=10, choices=ORDER_STATUSES,
                              default="pending", db_index=True)
    payment_method = models.CharField(max_length=20,
                                      choices=PAYMENT_METHODS,
                                      default="not_specified",
                                      verbose_name="Способ оплаты",
                                      db_index=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.PROTECT,
                                   related_name="orders",
                                   null=True, blank=True,
                                   verbose_name="Ресторан")
    comment = models.TextField(
        blank=True, verbose_name="Комментарий"
        )
    registered_at = models.DateTimeField(default=timezone.now, db_index=True,
                                         verbose_name="Когда зарегистрирован")
    called_at = models.DateTimeField(null=True, blank=True, db_index=True,
                                     verbose_name="Когда звонили")
    delivered_at = models.DateTimeField(null=True, blank=True, db_index=True,
                                        verbose_name="Когда доставили")

    objects = OrderQuerySet.as_manager()

    class Meta:
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'

    def __str__(self):
        return f"{self.firstname} {self.lastname}, {self.address}"


class OrderItem(models.Model):
    order = models.ForeignKey('Order', on_delete=models.CASCADE,
                              related_name="items",
                              verbose_name="Ассоциированный заказ")
    product = models.ForeignKey(Product,
                                on_delete=models.PROTECT,
                                related_name="order_items",
                                verbose_name="Продукты")
    quantity = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(10)],
                                   verbose_name="Количество")
    price = models.DecimalField(max_digits=7, decimal_places=2,
                                validators=[MinValueValidator(0)],
                                verbose_name="Цена")

    class Meta:
        verbose_name = 'Элемент заказа'
        verbose_name_plural = 'Элементы заказов'

    def __str__(self):
        return f"{self.product}, qty: {self.quantity}"
