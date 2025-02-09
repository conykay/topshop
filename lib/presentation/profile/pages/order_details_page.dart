import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/order/entities/order_item_entity.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderItemEntity order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: Text('Order Details')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.52,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: TimelineItemWidget(order: order),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Items',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondBackground,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.receipt_outlined, size: 30),
                      SizedBox(width: 24),
                      Text(
                        '${order.itemCount} Items',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shipping Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.secondBackground,
                  ),
                  child: Text(
                    order.shippingAdress,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimelineItemWidget extends StatelessWidget {
  const TimelineItemWidget({
    super.key,
    required this.order,
  });

  final OrderItemEntity order;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return TimelineTile(
          isFirst: index == 0 ? true : false,
          isLast: index == order.progress.length - 1 ? true : false,
          endChild: Container(
            height: 70,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              order.progress[index].title,
              style: TextStyle(fontSize: 20),
            ),
          ),
          indicatorStyle: IndicatorStyle(
              height: 25,
              width: 25,
              color:
                  order.progress[index].done ? AppColors.primary : Colors.grey,
              indicator: order.progress[index].done
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          size: 20,
                        ),
                      ),
                    )
                  : null),
          beforeLineStyle: LineStyle(
            color: index != 0
                ? order.progress[index - 1].done
                    ? AppColors.primary
                    : Colors.grey
                : Colors.grey,
          ),
          afterLineStyle: LineStyle(
            color: order.progress[index].done ? AppColors.primary : Colors.grey,
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 5),
      itemCount: order.progress.length,
    );
  }
}
