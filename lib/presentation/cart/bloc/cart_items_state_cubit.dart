import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/cart/usecases/get_cart_items.dart';
import 'package:topshop/presentation/cart/bloc/cart_items_state.dart';
import 'package:topshop/service_locator.dart';

class CartItemsStateCubit extends Cubit<CartItemsState> {
  CartItemsStateCubit() : super(LoadingCartItems());

  void getCartItems() async {
    var cartItems = await sl<GetCartItemsUseCase>().call();
    cartItems.fold(
      (error) => emit(FailedLoadingItems()),
      (data) => emit(LoadedCartItems(items: data)),
    );
  }
}
