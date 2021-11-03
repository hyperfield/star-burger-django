from django.http import JsonResponse
from django.templatetags.static import static
import json


from .models import Product, Order, OrderItem


def banners_list_api(request):
    # FIXME move data to db?
    return JsonResponse([
        {
            'title': 'Burger',
            'src': static('burger.jpg'),
            'text': 'Tasty Burger at your door step',
        },
        {
            'title': 'Spices',
            'src': static('food.jpg'),
            'text': 'All Cuisines',
        },
        {
            'title': 'New York',
            'src': static('tasty.jpg'),
            'text': 'Food is incomplete without a tasty dessert',
        }
    ], safe=False, json_dumps_params={
        'ensure_ascii': False,
        'indent': 4,
    })


def product_list_api(request):
    products = Product.objects.select_related('category').available()

    dumped_products = []
    for product in products:
        dumped_product = {
            'id': product.id,
            'name': product.name,
            'price': product.price,
            'special_status': product.special_status,
            'description': product.description,
            'category': {
                'id': product.category.id,
                'name': product.category.name,
            },
            'image': product.image.url,
            'restaurant': {
                'id': product.id,
                'name': product.name,
            }
        }
        dumped_products.append(dumped_product)
    return JsonResponse(dumped_products, safe=False, json_dumps_params={
        'ensure_ascii': False,
        'indent': 4,
    })


def serialize_products(order_items, order):
    # serialized_items = []
    for item in order_items:
        order_item = OrderItem()
        order_item.product = Product.objects.get(id=item['product'])
        order_item.quantity = item['quantity']
        order_item.order = order
        order_item.save()
        # serialized_items.append(order_item)
    # return serialized_items


def register_order(request):
    try:
        order = json.loads(request.body.decode())
        print(order)
        new_order = Order()
        new_order.save()
        serialize_products(order['products'], new_order)
        # new_order.order_items = serialized_order_items
        # print(new_order.order_items)
        new_order.firstname = order['firstname']
        new_order.lastname = order['lastname']
        new_order.telephone = order['phonenumber']
        new_order.address = order['address']
        new_order.save()

    except ValueError:
        return JsonResponse({
            'error': 'Value error (ошибка значения)',
        })
    return JsonResponse(order)
