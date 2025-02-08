import 'package:topshop/domain/order/entities/order_item_entity.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<OrderItemEntity> orders;

  OrdersLoaded({required this.orders});
}

class OrdersError extends OrdersState {}
