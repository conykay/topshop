import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/order/usecases/get_cart_items.dart';
import 'package:topshop/domain/order/usecases/remove_cart_item.dart';
import 'package:topshop/presentation/cart/bloc/cart_items_state.dart';
import 'package:topshop/service_locator.dart';

class CartItemsStateCubit extends Cubit<CartItemsState> {
  CartItemsStateCubit() : super(CartLoading());

  void getCartItems() async {
    var cartItems = await sl<GetCartItemsUseCase>().call();
    cartItems.fold(
      (error) => emit(CartError()),
      (data) => emit(CartLoaded(items: data)),
    );
  }

  void removeCartItem({required String itemId}) async {
    emit(CartLoading());
    var removeItem = await sl<RemoveCartItemUseCase>().call(params: itemId);
    removeItem.fold(
      (message) => emit(CartError()),
      (message) => getCartItems(),
    );
  }
}
