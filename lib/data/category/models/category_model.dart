import 'dart:convert';

import 'package:topshop/domain/category/entity/category.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryModel {
  final String categoryId;
  final String image;
  final String title;
  CategoryModel({
    required this.categoryId,
    required this.image,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'image': image,
      'title': title,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as String,
      image: map['image'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        categoryId: categoryId,
        image: image,
        title: title,
      );
}
