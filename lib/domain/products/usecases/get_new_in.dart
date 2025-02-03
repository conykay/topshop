import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/products/repository/products.dart';

import '../../../service_locator.dart';

class GetNewInUsecase extends UseCase {
  @override
  Future call({params}) async {
    return await sl<ProductsRepository>().getNewInProducts();
  }
}
