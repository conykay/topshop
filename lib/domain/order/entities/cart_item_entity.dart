// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:topshop/domain/products/entities/product_color_entity.dart';

class CartItemEntity {
  final String cartItemId;
  final String productId;
  final String productTitle;
  final int productQuantity;
  final ProductColorEntity productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final Timestamp createdDate;
  CartItemEntity({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
    required this.cartItemId,
  });
}
