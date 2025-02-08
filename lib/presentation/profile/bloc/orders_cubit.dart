import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/order/usecases/get_orders_usecase.dart';
import 'package:topshop/presentation/profile/bloc/orders_state.dart';
import 'package:topshop/service_locator.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void getOrders() async {
    emit(OrdersLoading());
    var orders = await sl<GetOrdersUsecase>().call();
    orders.fold(
      (error) => emit(OrdersError()),
      (data) => emit(OrdersLoaded(orders: data)),
    );
  }
}
