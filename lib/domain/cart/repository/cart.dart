import 'package:dartz/dartz.dart';

import '../../../data/cart/models/add_to_cart_req.dart';
import '../../../data/cart/models/checkout_req.dart';

abstract class CartRepository {
  Future<Either> addToCart({required AddToCartReq cartItem});
  Future<Either> getCartItems();
  Future<Either> removeCartItem({required String itemId});
  Future<Either> checkOutRequest({required CheckoutReq order});
}
