import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductColorModel {
  final String title;
  final String hex;
  ProductColorModel({
    required this.title,
    required this.hex,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hex': hex,
    };
  }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String,
      hex: map['hex'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
