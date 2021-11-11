from django.http import JsonResponse
from django.templatetags.static import static
from phonenumber_field.phonenumber import PhoneNumber
from rest_framework.decorators import api_view
from rest_framework.response import Response

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


def are_products_ids_present(order):
    products_ids = [product.id for product in Product.objects.all()]
    order_products_ids = [item["product"] for item in order["products"]]
    order_products_ids = [item["product"] for item in order["products"]]
    absent_products_ids = []
    for product_id in order_products_ids:
        if product_id not in products_ids:
            absent_products_ids.append(product_id)
    return absent_products_ids


def check_order_keys(order, expected_keys):
    absent_keys = []
    for key in expected_keys:
        if key not in order.keys():
            absent_keys.append(key)
    return absent_keys


def check_keys_contents(order, expected_keys):
    absent_keys_contents = []
    for key in expected_keys:
        if not order[key]:
            absent_keys_contents.append(key)
    return absent_keys_contents


@api_view(['POST'])
def register_order(request):
    try:
        order = request.data
        print(order)
        missing_products_ids = are_products_ids_present(order)
        if missing_products_ids:
            missing_products_ids = ", ".join(map(str, missing_products_ids))
            return Response({
                'error':
                f'There are no products with id(s) {missing_products_ids}!',
            })
        if not isinstance(order['products'], list):
            return Response({
                'error': "'products' is not a list or is not present",
            })
        expected_keys = ["firstname", "lastname", "address", "phonenumber"]
        missing_keys = check_order_keys(order, expected_keys)
        if missing_keys:
            missing_keys = ", ".join(missing_keys)
            return Response({
                'error': f"The following keys are absent: {missing_keys}!",
            })
        missing_keys_contents = check_keys_contents(order, expected_keys)
        if missing_keys_contents:
            missing_keys_contents = ", ".join(missing_keys_contents)
            return Response({
                'error':
                f"The following entries are required: '{missing_keys_contents}'",
            })
        phonenumber = PhoneNumber.from_string(order["phonenumber"])
        if not phonenumber.is_valid():
            return Response({
                'error':
                f"Invalid phone number {order['phonenumber']}",
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
