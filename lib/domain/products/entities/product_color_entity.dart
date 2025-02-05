// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data/products/models/product_color_model.dart';

class ProductColorEntity {
  final String title;
  final String hex;
  ProductColorEntity({
    required this.title,
    required this.hex,
  });
}

extension ProductColorXModel on ProductColorEntity {
  ProductColorModel toModel() => ProductColorModel(title: title, hex: hex);
}
