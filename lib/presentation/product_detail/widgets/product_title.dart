import 'package:flutter/cupertino.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity product;
  const ProductTitle({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        product.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
