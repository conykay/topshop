import 'package:dartz/dartz.dart';
import 'package:topshop/data/order/models/add_to_cart_req.dart';
import 'package:topshop/data/order/models/cart_item_model.dart';
import 'package:topshop/data/order/models/checkout_req.dart';
import 'package:topshop/data/order/source/order_firebase_service.dart';
import 'package:topshop/domain/order/repository/order.dart';

import '../../../service_locator.dart';

class OrderRepositoryImp extends OrderRepository {
  @override
  Future<Either> addToCart({required AddToCartReq cartItem}) async {
    return await sl<OrderFirebaseService>().addToCart(cartItem: cartItem);
  }

  @override
  Future<Either> getCartItems() async {
    var returnedData = await sl<OrderFirebaseService>().getCartItems();
    return returnedData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map((e) => CartItemModel.fromMap(e).toEntity())
            .toList(),
      ),
    );
  }

  @override
  Future<Either> removeCartItem({required String itemId}) async {
    var returnedData =
        await sl<OrderFirebaseService>().removeCartItem(itemId: itemId);
    return returnedData.fold(
      (error) => Left(error),
      (message) => Right(message),
    );
  }

  @override
  Future<Either> checkOutRequest({required CheckoutReq order}) async {
    var returnedData =
        await sl<OrderFirebaseService>().checkOutRequest(order: order);
    return returnedData.fold(
      (error) => Left(error),
      (message) => Right(message),
    );
  }
}
