import 'package:dartz/dartz.dart';
import 'package:topshop/data/products/models/product_model.dart';
import 'package:topshop/data/products/source/products_firebase_service.dart';
import 'package:topshop/domain/products/repository/products.dart';
import 'package:topshop/service_locator.dart';

class ProductsRepositoryImp extends ProductsRepository {
  @override
  Future<Either> getTopSellingProducts() async {
    var productsData =
        await sl<ProductsFirebaseService>().getTopSellingProducts();
    return productsData.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map(
              (e) => ProductModel.fromMap(e).toEntity(),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either> getNewInProducts() async {
    var newInProducts = await sl<ProductsFirebaseService>().getNewInProducts();
    return newInProducts.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map(
              (e) => ProductModel.fromMap(e).toEntity(),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<Either> getCategoryProducts({required String categoryId}) async {
    var categoryProducts = await sl<ProductsFirebaseService>()
        .getCategoryProducts(categoryId: categoryId);
    return categoryProducts.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map(
              (e) => ProductModel.fromMap(e).toEntity(),
            )
            .toList(),
      ),
    );
  }
}
