import '../../../domain/products/entity/product_entity.dart';

class ProductPriceHelper {
  static double productPrice({required ProductEntity product}) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
}
