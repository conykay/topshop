import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.secondBackground,
                  width: 2,
                )),
            child: Text(
              '\$ ${ProductPriceHelper.productPrice(product: product)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(width: 20),
          Text(
            product.discountedPrice == 0 ? '' : product.price.toString(),
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
