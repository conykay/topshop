import 'package:topshop/domain/order/entities/cart_item_entity.dart';

class CartHelper {
  static double cartTotal({required List<CartItemEntity> items}) {
    double cartTotal = 0;
    for (var item in items) {
      cartTotal += item.totalPrice;
    }
    return double.parse(cartTotal.toStringAsFixed(2));
  }

  static double tax({required List<CartItemEntity> items}) {
    var taxPercent = 0.16;
    var cartTotalCalc = cartTotal(items: items);
    return double.parse((taxPercent * cartTotalCalc).toStringAsFixed(2));
  }

  static double shippingFee({required List<CartItemEntity> items}) {
    var shippingPercent = 0.1;
    var cartTotalCalc = cartTotal(items: items);
    return double.parse((shippingPercent * cartTotalCalc).toStringAsFixed(2));
  }

  static double subTotal({required List<CartItemEntity> items}) {
    return double.parse((cartTotal(items: items) +
            shippingFee(items: items) +
            tax(items: items))
        .toStringAsFixed(2));
  }

  static List<Map<String, dynamic>> get initialProgress {
    var intitalData = [
      {'title': 'Order Placed', 'done': true},
      {'title': 'Order Confirmed', 'done': false},
      {'title': 'Order Processed', 'done': false},
      {'title': 'Order Shipped', 'done': false},
      {'title': 'Order Delivered', 'done': false},
    ];
    return intitalData;
  }
}
