import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/data/order/models/add_to_cart_req.dart';
import 'package:topshop/domain/order/repository/order.dart';
import 'package:topshop/service_locator.dart';

class AddToCartUseCase extends UseCase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return await sl<OrderRepository>().addToCart(cartItem: params!);
  }
}
