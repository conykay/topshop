import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/products/usecases/add_remove_favorite.dart';
import 'package:topshop/domain/products/usecases/is_in_favorites.dart';
import 'package:topshop/service_locator.dart';

import '../../../data/products/models/product_model.dart';

class FavoritesCubit extends Cubit<bool> {
  FavoritesCubit() : super(false);

  void addRemoveFavorites({required ProductModel product}) async {
    var isInFavorites =
        await sl<AddRemoveFavoriteUseCase>().call(params: product);
    emit(isInFavorites);
  }

  void isInFavorites({required String productId}) async {
    var isFavorite = await sl<IsInFavoritesUseCase>().call(params: productId);
    emit(isFavorite);
  }
}
