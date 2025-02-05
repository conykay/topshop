import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/helper/product/product_color_helper.dart';
import 'package:topshop/common/widgets/bottomsheet/ages_bottomsheet.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/product_color_select_cubit.dart';
import 'package:topshop/presentation/product_detail/widgets/product_colors.dart';

class SelectedColor extends StatelessWidget {
  final ProductEntity product;
  const SelectedColor({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductColorSelectCubit>(context),
            child: ProductColors(product: product),
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
              'Color',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ProductColorSelectCubit, int>(
                    builder: (context, state) => Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: ProductColorHelper.color(
                              hex: product.colors[state].hex,
                            ),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                          ),
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
