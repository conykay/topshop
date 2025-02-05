import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/helper/product/product_color_helper.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/product_color_select_cubit.dart';
import 'package:topshop/presentation/product_detail/bloc/product_size_select_cubit_bloc.dart';

import '../../../core/configs/theme/app_colors.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity product;
  const ProductColors({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Colors',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BlocBuilder<ProductColorSelectCubit, int>(
                    builder: (context, state) => GestureDetector(
                          onTap: () {
                            context
                                .read<ProductColorSelectCubit>()
                                .selectColor(index: index);
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: state != index
                                  ? AppColors.secondBackground
                                  : AppColors.primary,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.colors[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 32,
                                      width: 32,
                                      decoration: BoxDecoration(
                                        color: ProductColorHelper.color(
                                            hex: product.colors[index].hex),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    state == index
                                        ? Icon(
                                            Icons.check,
                                            size: 30,
                                          )
                                        : SizedBox(
                                            width: 30,
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ));
              },
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: product.colors.length,
            ),
          ),
        ],
      ),
    );
  }
}
