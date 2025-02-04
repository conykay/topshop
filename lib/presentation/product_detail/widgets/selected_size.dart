import 'package:flutter/material.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';

class SelectedSize extends StatelessWidget {
  const SelectedSize({super.key, required ProductEntity product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Size',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Row(
            children: [
              Text(
                'S',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(width: 16),
              Icon(
                Icons.arrow_drop_down_outlined,
                size: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
