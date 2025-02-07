import 'package:dartz/dartz.dart';

import '../../../data/products/models/product_model.dart';

abstract class ProductsRepository {
  Future<Either> getTopSellingProducts();
  Future<Either> getNewInProducts();
  Future<Either> getCategoryProducts({required String categoryId});
  Future<Either> getSearchedProduct({required String title});
  Future<bool> addRemoveFavorites({required ProductModel product});
  Future<bool> isInFavorite({required String productId});
  Future<Either> getFavorites();
}
