import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topshop/data/products/models/product_color_model.dart';

class AddToCartReq {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final ProductColorModel productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final Timestamp createdDate;
  AddToCartReq({
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
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor.toMap(),
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
    };
  }
}
