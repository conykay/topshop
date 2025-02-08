// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:topshop/domain/order/entities/cart_item_entity.dart';

class OrderItemEntity {
  final List<CartItemEntity> items;
  final Timestamp createdDate;
  final String shippingAdress;
  final int itemCount;
  final double totalPrice;
  OrderItemEntity({
    required this.items,
    required this.createdDate,
    required this.shippingAdress,
    required this.itemCount,
    required this.totalPrice,
  });
}
