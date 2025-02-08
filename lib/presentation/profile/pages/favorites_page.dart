import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/domain/products/usecases/get_favorites.dart';
import 'package:topshop/service_locator.dart';

import '../widgets/favorites_grid_widget.dart';
import '../widgets/no_items_widget.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDisplayCubit(usecase: sl<GetFavoritesUseCase>())
            ..getProducts(),
      child: Scaffold(
        appBar: BasicAppBar(title: Text('My Favorites')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BlocBuilder<ProductDisplayCubit, ProductsDisplayState>(
              builder: (context, state) {
            if (state is LoadedProducts) {
              return state.products.isNotEmpty
                  ? FavoritesProductsGrid(
                      products: state.products,
                    )
                  : NoItemsWidget(
                      message: 'You dont seem to like anything :(',
                      icon: Icons.star_half_rounded,
                    );
            }
            if (state is LoadingProducts) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
