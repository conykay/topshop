import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/products/repository/products.dart';
import 'package:topshop/service_locator.dart';

class GetProductTopSelling extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductsRepository>().getTopSelling();
  }
}
