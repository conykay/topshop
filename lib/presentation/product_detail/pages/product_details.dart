import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state_cubit.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/data/products/models/product_model.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/add_remove_cubit.dart';
import 'package:topshop/presentation/product_detail/bloc/product_color_select_cubit.dart';
import 'package:topshop/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:topshop/presentation/product_detail/bloc/product_size_select_cubit_bloc.dart';
import 'package:topshop/presentation/product_detail/widgets/add_to_cart_button.dart';
import 'package:topshop/presentation/product_detail/widgets/product_Images.dart';
import 'package:topshop/presentation/product_detail/widgets/product_price.dart';
import 'package:topshop/presentation/product_detail/widgets/product_quantity.dart';
import 'package:topshop/presentation/product_detail/widgets/product_title.dart';
import 'package:topshop/presentation/product_detail/widgets/selected_color.dart';
import 'package:topshop/presentation/product_detail/widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity product;
  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductSizeSelectCubit()),
        BlocProvider(create: (context) => ProductColorSelectCubit()),
        BlocProvider(create: (context) => ButtonStateCubit()),
        BlocProvider(
            create: (context) =>
                FavoritesCubit()..isInFavorites(productId: product.productId)),
      ],
      child: Scaffold(
        appBar: BasicAppBar(
          action: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                context
                    .read<FavoritesCubit>()
                    .addRemoveFavorites(product: product.toModel());
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.circular(100)),
                child: BlocBuilder<FavoritesCubit, bool>(
                    builder: (context, state) {
                  return state
                      ? Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : Icon(Icons.star);
                }),
              ),
            );
          }),
        ),
        bottomNavigationBar: AddToCartButton(product: product),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(product: product),
              SizedBox(height: 10),
              ProductTitle(product: product),
              SizedBox(height: 10),
              ProductPrice(product: product),
              SizedBox(height: 15),
              SelectedSize(product: product),
              SizedBox(height: 15),
              SelectedColor(product: product),
              SizedBox(height: 15),
              ProductQuantity(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
