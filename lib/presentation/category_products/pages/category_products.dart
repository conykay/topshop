import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/product/product_card.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/category/entities/category.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/domain/products/usecases/get_by_category.dart';

import '../../../service_locator.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity category;
  const CategoryProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: BlocProvider(
        create: (context) => ProductDisplayCubit(
          usecase: sl<GetProductsByCategoryUseCase>(),
        )..getProducts(params: category.categoryId),
        child: BlocBuilder<ProductDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
          if (state is LoadingProducts) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedProducts) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CategoryInfoText(
                      category: category, products: state.products),
                  SizedBox(height: 20),
                  _CategoryProductsGrid(products: state.products),
                ],
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}

class _CategoryProductsGrid extends StatelessWidget {
  const _CategoryProductsGrid({
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
        itemCount: products.length,
      ),
    );
  }
}

class _CategoryInfoText extends StatelessWidget {
  const _CategoryInfoText({
    required this.category,
    required this.products,
  });

  final CategoryEntity category;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          category.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          'Availabe: ${products.length}',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
