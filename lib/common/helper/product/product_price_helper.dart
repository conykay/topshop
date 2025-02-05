import '../../../domain/products/entities/product_entity.dart';

class ProductPriceHelper {
  static double productPrice({required ProductEntity product}) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }

  static double round({required double price}) {
    return double.parse(price.toStringAsFixed(2));
  }
}
