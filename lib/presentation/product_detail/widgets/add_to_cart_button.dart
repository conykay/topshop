import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state.dart';
import 'package:topshop/common/bloc/button/button_state_cubit.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/helper/product/product_price_helper.dart';
import 'package:topshop/common/widgets/button/basic_reactive_button.dart';
import 'package:topshop/data/cart/models/add_to_cart_req.dart';
import 'package:topshop/data/products/models/product_color_model.dart';
import 'package:topshop/domain/cart/usecases/add_to_cart.dart';
import 'package:topshop/domain/products/entities/product_color_entity.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/cart/pages/cart_page.dart';
import 'package:topshop/presentation/product_detail/bloc/product_color_select_cubit.dart';
import 'package:topshop/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:topshop/presentation/product_detail/bloc/product_size_select_cubit_bloc.dart';
import 'package:topshop/service_locator.dart';

class AddToCartButton extends StatelessWidget {
  final ProductEntity product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (ontext, state) {
        if (state is ButtonSuccessSate) {
          AppNavigator.push(context, CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BasicReactiveButton(
          onPressed: () {
            _addToCart(context);
          },
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<ProductQuantityCubit, int>(builder: (context, state) {
                return Text(
                  '\$ ${(ProductPriceHelper.productPrice(product: product) * state).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                );
              }),
              Text(
                'Add To Cart',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    var colorsState = context.read<ProductColorSelectCubit>().state;
    var sizeState = context.read<ProductSizeSelectCubit>().state;
    var quantityState = context.read<ProductQuantityCubit>().state;
    var colorValue = ProductColorEntity(
            title: product.colors[colorsState].title,
            hex: product.colors[colorsState].hex)
        .toModel();
    var price = ProductPriceHelper.productPrice(product: product);
    var total = ProductPriceHelper.round(price: price * quantityState);

    var productDetails = AddToCartReq(
      productId: product.productId,
      productTitle: product.title,
      productQuantity: quantityState,
      productColor: colorValue,
      productSize: product.sizes[sizeState],
      productPrice: ProductPriceHelper.productPrice(product: product),
      totalPrice: total,
      productImage: product.images[0],
      createdDate: Timestamp.now(),
    );

    context
        .read<ButtonStateCubit>()
        .execute(usecase: sl<AddToCartUseCase>(), params: productDetails);
  }
}
