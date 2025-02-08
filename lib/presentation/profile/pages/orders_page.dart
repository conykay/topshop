import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/order/entities/order_item_entity.dart';
import 'package:topshop/presentation/profile/bloc/orders_cubit.dart';
import 'package:topshop/presentation/profile/bloc/orders_state.dart';

import '../widgets/no_items_widget.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..getOrders(),
      child: Scaffold(
        appBar: const BasicAppBar(
          title: Text('Your Orders'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              if (state is OrdersLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is OrdersLoaded) {
                return state.orders.isNotEmpty
                    ? OrderListItem(orders: state.orders)
                    : NoItemsWidget(
                        message: 'You dont have any pending orders',
                        icon: Icons.car_crash,
                      );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final List<OrderItemEntity> orders;
  const OrderListItem({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.receipt_outlined,
                  size: 25,
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order #${index + 1}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('${orders[index].itemCount} items'),
                  ],
                ),
              ),
              Expanded(
                child: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemCount: orders.length,
      ),
    );
  }
}
