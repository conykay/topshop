import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/product_size_select_cubit_bloc.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity product;
  const ProductSizes({super.key, required this.product});

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
                    'Size',
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
                return BlocBuilder<ProductSizeSelectCubit, int>(
                    builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<ProductSizeSelectCubit>()
                          .selectSize(index: index);
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
                            product.sizes[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          state != index
                              ? Container()
                              : Icon(
                                  Icons.check,
                                  size: 30,
                                ),
                        ],
                      ),
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) => SizedBox(height: 15),
              itemCount: product.sizes.length,
            ),
          ),
        ],
      ),
    );
  }
}
