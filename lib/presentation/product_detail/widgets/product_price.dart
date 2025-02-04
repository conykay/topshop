import 'package:flutter/cupertino.dart';
import 'package:topshop/common/helper/product/product_price_helper.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity product;
  const ProductPrice({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '\$ ${ProductPriceHelper.productPrice(product: product)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          fontSize: 16,
        ),
      ),
    );
  }
}
