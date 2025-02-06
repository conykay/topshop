import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/cart/repository/cart.dart';
import 'package:topshop/service_locator.dart';

class RemoveCartItemUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<CartRepository>().removeCartItem(itemId: params!);
  }
}
