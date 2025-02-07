import 'package:dartz/dartz.dart';

import '../../../data/order/models/add_to_cart_req.dart';
import '../../../data/order/models/checkout_req.dart';

abstract class OrderRepository {
  Future<Either> addToCart({required AddToCartReq cartItem});
  Future<Either> getCartItems();
  Future<Either> removeCartItem({required String itemId});
  Future<Either> checkOutRequest({required CheckoutReq order});
}
