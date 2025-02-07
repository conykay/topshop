import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/products/repository/products.dart';
import 'package:topshop/service_locator.dart';

class IsInFavoritesUseCase extends UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<ProductsRepository>().isInFavorite(productId: params!);
  }
}
