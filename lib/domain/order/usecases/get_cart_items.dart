import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/order/repository/order.dart';
import 'package:topshop/service_locator.dart';

class GetCartItemsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<OrderRepository>().getCartItems();
  }
}
