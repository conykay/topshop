import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/widgets/bottomsheet/ages_bottomsheet.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/product_size_select_cubit_bloc.dart';
import 'package:topshop/presentation/product_detail/widgets/product_sizes.dart';

class SelectedSize extends StatelessWidget {
  final ProductEntity product;
  const SelectedSize({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductSizeSelectCubit>(context),
            child: ProductSizes(product: product),
          ),
        );
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Size',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductSizeSelectCubit, int>(
                    builder: (context, state) => Text(
                          product.sizes[state],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )),
                SizedBox(width: 16),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  size: 30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
