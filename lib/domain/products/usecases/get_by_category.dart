import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/products/repository/products.dart';

import '../../../service_locator.dart';

class GetProductsByCategoryUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductsRepository>()
        .getCategoryProducts(categoryId: params!);
  }
}
