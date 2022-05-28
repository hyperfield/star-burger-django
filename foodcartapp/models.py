from django.db import models
from phonenumber_field.modelfields import PhoneNumberField
from django.core.validators import MinValueValidator, MaxValueValidator
from django.utils import timezone


class Restaurant(models.Model):
    name = models.CharField(
        'Name',
        max_length=50
    )
    address = models.CharField(
        'Address',
        max_length=100,
        blank=True,
    )
    contact_phone = models.CharField(
        'Telephone',
        max_length=50,
        blank=True,
    )

    class Meta:
        verbose_name = 'Restaurant'
        verbose_name_plural = 'Restaurants'

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
        'Name',
        max_length=50
    )

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'

    def __str__(self):
        return self.name


class Product(models.Model):
    name = models.CharField(
        'Name',
        max_length=50
    )
    category = models.ForeignKey(
        ProductCategory,
        verbose_name='Category',
        related_name='products',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
    )
    price = models.DecimalField(
        'Price',
        max_digits=8,
        decimal_places=2,
        validators=[MinValueValidator(0)]
    )
    image = models.ImageField(
        'Picture'
    )
    special_status = models.BooleanField(
        'Special offer',
        default=False,
        db_index=True,
    )
    description = models.TextField(
        'Description',
        max_length=200,
        blank=True,
    )

    objects = ProductQuerySet.as_manager()

    class Meta:
        verbose_name = 'Item'
        verbose_name_plural = 'Items'

    def __str__(self):
        return self.name


class RestaurantMenuItem(models.Model):
    restaurant = models.ForeignKey(
        Restaurant,
        related_name='menu_items',
        verbose_name="Restaurant",
        on_delete=models.CASCADE,
    )
    product = models.ForeignKey(
        Product,
        on_delete=models.CASCADE,
        related_name='menu_items',
        verbose_name='Item',
    )
    availability = models.BooleanField(
        'In stock',
        default=True,
        db_index=True
    )

    class Meta:
        verbose_name = 'Restaurant menu item'
        verbose_name_plural = 'Restaurant menu items'
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
        ("pending", "Pending"),
        ("processing", "Processing"),
        ("completed", "Completed"),
        ("cancelled", "Cancelled"),
    )

    PAYMENT_METHODS = (
        ("cash", "Cash"),
        ("electronic", "Electronic"),
        ("not_specified", "Not specified"),
    )

    firstname = models.CharField(max_length=20, verbose_name="First name")
    lastname = models.CharField(max_length=20, verbose_name="Last name")
    phonenumber = PhoneNumberField(verbose_name="Telephone", db_index=True)
    address = models.CharField(max_length=200, verbose_name="Address")
    status = models.CharField(max_length=10, choices=ORDER_STATUSES,
                              default="pending", db_index=True)
    payment_method = models.CharField(max_length=20,
                                      choices=PAYMENT_METHODS,
                                      default="not_specified",
                                      verbose_name="Payment method",
                                      db_index=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.PROTECT,
                                   related_name="orders",
                                   null=True, blank=True,
                                   verbose_name="Restaurant")
    comment = models.TextField(
        blank=True, verbose_name="Comment"
        )
    registered_at = models.DateTimeField(default=timezone.now, db_index=True,
                                         verbose_name="Registration timestamp")
    called_at = models.DateTimeField(null=True, blank=True, db_index=True,
                                     verbose_name="Call timestamp")
    delivered_at = models.DateTimeField(null=True, blank=True, db_index=True,
                                        verbose_name="Delivery timestamp")

    objects = OrderQuerySet.as_manager()

    class Meta:
        verbose_name = 'Order'
        verbose_name_plural = 'Orders'

    def __str__(self):
        return f"{self.firstname} {self.lastname}, {self.address}"


class OrderItem(models.Model):
    order = models.ForeignKey('Order', on_delete=models.CASCADE,
                              related_name="items",
                              verbose_name="Associated order")
    product = models.ForeignKey(Product,
                                on_delete=models.PROTECT,
                                related_name="order_items",
                                verbose_name="Items")
    quantity = models.IntegerField(validators=[MinValueValidator(1),
                                               MaxValueValidator(10)],
                                   verbose_name="Quantity")
    price = models.DecimalField(max_digits=7, decimal_places=2,
                                validators=[MinValueValidator(0)],
                                verbose_name="Price")

    class Meta:
        verbose_name = 'Order element'
        verbose_name_plural = 'Order elements'

    def __str__(self):
        return f"{self.product}, qty: {self.quantity}"
