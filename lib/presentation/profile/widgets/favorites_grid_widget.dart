import 'package:flutter/material.dart';

import '../../../common/widgets/product/product_card.dart';
import '../../../domain/products/entities/product_entity.dart';

class FavoritesProductsGrid extends StatelessWidget {
  const FavoritesProductsGrid({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
      itemCount: products.length,
    );
  }
}
