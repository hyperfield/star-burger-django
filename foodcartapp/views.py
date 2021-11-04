from django.http import JsonResponse
from django.templatetags.static import static
from rest_framework.decorators import api_view
from rest_framework.response import Response
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
    for item in order_items:
        order_item = OrderItem()
        order_item.product = Product.objects.get(id=item['product'])
        order_item.quantity = item['quantity']
        order_item.order = order
        order_item.save()
        # serialized_items.append(order_item)
    # return serialized_items


@api_view(['POST'])
def register_order(request):
    try:
        order = request.data
        print(order)
        if not isinstance(order['products'], OrderItem):
            return Response({
                'error': '"products" is not a list or is not present',
            })
        new_order = Order()
        new_order.save()
        serialize_products(order['products'], new_order)
        new_order.firstname = order['firstname']
        new_order.lastname = order['lastname']
        new_order.telephone = order['phonenumber']
        new_order.address = order['address']
        new_order.save()

    except ValueError:
        return Response({
            'error': 'Value error (ошибка значения)',
        })

    except KeyError:
        return Response({
            'error': 'The key "products" is not present',
        })

    return Response(order)

