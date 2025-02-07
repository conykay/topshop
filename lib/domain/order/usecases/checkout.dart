import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/data/order/models/checkout_req.dart';
import 'package:topshop/domain/order/repository/order.dart';
import 'package:topshop/service_locator.dart';

class CheckoutUseCase extends UseCase<Either, CheckoutReq> {
  @override
  Future<Either> call({CheckoutReq? params}) async {
    return await sl<OrderRepository>().checkOutRequest(order: params!);
  }
}
