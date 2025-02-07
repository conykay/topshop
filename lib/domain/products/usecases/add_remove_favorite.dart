import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/data/products/models/product_model.dart';
import 'package:topshop/domain/products/repository/products.dart';
import 'package:topshop/service_locator.dart';

class AddRemoveFavoriteUseCase extends UseCase<bool, ProductModel> {
  @override
  Future<bool> call({ProductModel? params}) async {
    return await sl<ProductsRepository>().addRemoveFavorites(product: params!);
  }
}
