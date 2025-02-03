import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/domain/products/usecases/get_search_product.dart';
import 'package:topshop/presentation/search/widgets/search.dart';
import 'package:topshop/service_locator.dart';

import '../../../common/widgets/product/product_card.dart';
import '../../../domain/products/entity/product_entity.dart';

class SearchProductsPage extends StatelessWidget {
  const SearchProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDisplayCubit(usecase: sl<GetSearchProductUseCase>()),
      child: Scaffold(
        appBar: BasicAppBar(title: ProductsSearch()),
        body: BlocBuilder<ProductDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is LoadingProducts) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is LoadedProducts) {
              if (state.products.isEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 100,
                        color: CupertinoColors.systemYellow,
                      ),
                      Text(
                        'oops! The item you searched for doesnt seem to be available, sorry.',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _CategoryProductsGrid(products: state.products),
                );
              }
            }

            return Container();
          },
        ),
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
