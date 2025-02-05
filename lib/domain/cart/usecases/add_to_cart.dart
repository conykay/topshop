import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/data/cart/models/add_to_cart_req.dart';
import 'package:topshop/domain/cart/repository/cart.dart';
import 'package:topshop/service_locator.dart';

class AddToCartUseCase extends UseCase<Either,AddToCartReq>{
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return await sl<CartRepository>().addToCart(cartItem: params!);
  }
}