import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/product_quantity_cubit.dart';

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
        borderRadius: BorderRadius.circular(10),
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
                onPressed: () {
                  context.read<ProductQuantityCubit>().decrement();
                },
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              BlocBuilder<ProductQuantityCubit, int>(builder: (context, state) {
                return Text(
                  state.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                );
              }),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  context.read<ProductQuantityCubit>().increment();
                },
                icon: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20,
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
