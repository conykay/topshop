import 'package:topshop/domain/cart/entities/cart_item_entity.dart';

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
}
