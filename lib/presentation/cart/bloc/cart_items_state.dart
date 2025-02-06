import 'package:topshop/domain/cart/entities/cart_item_entity.dart';

abstract class CartItemsState {}

class CartLoading extends CartItemsState {}

class CartLoaded extends CartItemsState {
  final List<CartItemEntity> items;

  CartLoaded({required this.items});
}

class CartError extends CartItemsState {}
