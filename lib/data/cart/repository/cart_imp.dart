import 'package:dartz/dartz.dart';
import 'package:topshop/data/cart/models/add_to_cart_req.dart';
import 'package:topshop/data/cart/models/cart_item_model.dart';
import 'package:topshop/data/cart/source/cart_firebase_service.dart';
import 'package:topshop/domain/cart/repository/cart.dart';

import '../../../service_locator.dart';

class CartRepositoryImp extends CartRepository {
  @override
  Future<Either> addToCart({required AddToCartReq cartItem}) async {
    return await sl<CartFirebaseService>().addToCart(cartItem: cartItem);
  }

  @override
  Future<Either> getCartItems() async {
    var returnedData = await sl<CartFirebaseService>().getCartItems();
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map((e) => CartItemModel.fromMap(e).toEntity())
            .toList(),
      ),
    );
  }
}
