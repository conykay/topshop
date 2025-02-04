import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';

import '../../../core/configs/theme/app_colors.dart';

class ProductQuantity extends StatelessWidget {
  final ProductEntity product;
  const ProductQuantity({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Quantity',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                '2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
