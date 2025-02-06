// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topshop/domain/cart/entities/cart_item_entity.dart';

import '../../products/models/product_color_model.dart';

class CartItemModel {
  final String cartItemId;
  final String productId;
  final String productTitle;
  final int productQuantity;
  final ProductColorModel productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final Timestamp createdDate;

  CartItemModel({
    required this.cartItemId,
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cartItemId': cartItemId,
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor.toMap(),
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate.toString(),
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      cartItemId: map['cartItemId'] as String,
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: ProductColorModel.fromMap(
          map['productColor'] as Map<String, dynamic>),
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createdDate: map['createdDate'] as Timestamp,
    );
  }
}

extension CartItemXEntity on CartItemModel {
  CartItemEntity toEntity() => CartItemEntity(
      cartItemId: cartItemId,
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productColor: productColor.toEntity(),
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate);
}

extension CartItemXModel on CartItemEntity {
  CartItemModel toModel() => CartItemModel(
      cartItemId: cartItemId,
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productColor: productColor.toModel(),
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate);
}
