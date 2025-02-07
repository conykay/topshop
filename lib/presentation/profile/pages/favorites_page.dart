import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/domain/products/usecases/get_favorites.dart';
import 'package:topshop/service_locator.dart';

import '../../../common/helper/nav/app_navigation.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../all_categories/pages/categories_display_page.dart';
import '../widgets/favorites_grid_widget.dart';

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
                  : _NoItems();
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

class _NoItems extends StatelessWidget {
  const _NoItems();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_half_rounded,
            size: 150,
            color: Colors.yellowAccent,
          ),
          SizedBox(height: 20),
          Text(
            'You dont seem to like anything :(',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 180,
            child: BasicButton(
                onPressed: () {
                  AppNavigator.pushReplacement(context, AllCategoriesPage());
                },
                title: 'Explore Categories'),
          )
        ],
      ),
    );
  }
}
