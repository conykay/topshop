// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topshop/data/order/models/cart_item_model.dart';
import 'package:topshop/data/order/models/order_progress_model.dart';
import 'package:topshop/domain/order/entities/cart_item_entity.dart';
import 'package:topshop/domain/order/entities/order_progress_entity.dart';

class CheckoutReq {
  final List<CartItemEntity> items;
  final Timestamp createdDate;
  final String shippingAdress;
  final int itemCount;
  final double totalPrice;
  final List<OrderProgressEntity> progress;

  CheckoutReq(
      {required this.progress,
      required this.items,
      required this.createdDate,
      required this.shippingAdress,
      required this.itemCount,
      required this.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toModel().toMap()).toList(),
      'createdDate': createdDate,
      'shippingAdress': shippingAdress,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'progress': progress.map((e) => e.toModel().toMap()).toList(),
    };
  }
}
