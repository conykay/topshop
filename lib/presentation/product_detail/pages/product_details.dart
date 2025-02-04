import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state_cubit.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
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
      ],
      child: Scaffold(
        appBar: BasicAppBar(),
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
              SizedBox(height: 20),
              SelectedSize(product: product),
              SizedBox(height: 20),
              SelectedColor(product: product),
              SizedBox(height: 20),
              ProductQuantity(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
