// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';

import 'product_color_model.dart';

class ProductModel {
  final String categoryId;
  final List<ProductColorModel> colors;
  final Timestamp createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> images;
  final num price;
  final List<String> sizes;
  final String productId;
  final int salesNumber;
  final String title;
  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.images,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((x) => x.toMap()).toList(),
      'createdDate': createdDate.toString(),
      'discountedPrice': discountedPrice,
      'gender': gender,
      'images': images,
      'price': price,
      'sizes': sizes,
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      categoryId: map['categoryId'] as String,
      colors: List<ProductColorModel>.from(
        (map['colors'] as List<int>).map<ProductColorModel>(
          (x) => ProductColorModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdDate: map['createdDate'] as Timestamp,
      discountedPrice: map['discountedPrice'] as num,
      gender: map['gender'] as int,
      images: List<String>.from(
          map['images'].map((e) => e.toString()) as List<String>),
      price: map['price'] as num,
      sizes: List<String>.from((map['sizes'] as List<String>)),
      productId: map['productId'] as String,
      salesNumber: map['salesNumber'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductModelXEntity on ProductModel {
  ProductEntity toEntity() => ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      discountedPrice: discountedPrice,
      gender: gender,
      images: images,
      price: price,
      sizes: sizes,
      productId: productId,
      salesNumber: salesNumber,
      title: title);
}
