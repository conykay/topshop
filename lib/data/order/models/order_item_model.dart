// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topshop/data/order/models/cart_item_model.dart';
import 'package:topshop/domain/order/entities/order_item_entity.dart';

import '../../../domain/order/entities/cart_item_entity.dart';

class OrderItemModel {
  final List<CartItemEntity> items;
  final Timestamp createdDate;
  final String shippingAdress;
  final int itemCount;
  final double totalPrice;
  OrderItemModel({
    required this.items,
    required this.createdDate,
    required this.shippingAdress,
    required this.itemCount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((e) => e.toModel().toMap()),
      'createdDate': createdDate,
      'shippingAdress': shippingAdress,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      items: List.from(map['items'])
          .map((e) => CartItemModel.fromMap(e).toEntity())
          .toList(),
      createdDate: map['createdDate'] as Timestamp,
      shippingAdress: map['shippingAdress'] as String,
      itemCount: map['itemCount'] as int,
      totalPrice: map['totalPrice'] as double,
    );
  }
}

extension OrderItemXEntity on OrderItemModel {
  OrderItemEntity toEntity() => OrderItemEntity(
      items: items,
      createdDate: createdDate,
      shippingAdress: shippingAdress,
      itemCount: itemCount,
      totalPrice: totalPrice);
}
