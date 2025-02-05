import 'package:topshop/domain/cart/entities/cart_item_entity.dart';

abstract class CartItemsState {}

class LoadingCartItems extends CartItemsState {}

class LoadedCartItems extends CartItemsState {
  final List<CartItemEntity> items;

  LoadedCartItems({required this.items});
}

class FailedLoadingItems extends CartItemsState {}
