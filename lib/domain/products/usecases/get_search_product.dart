import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/products/repository/products.dart';
import 'package:topshop/service_locator.dart';

class GetSearchProductUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductsRepository>().getSearchedProduct(title: params!);
  }
}
