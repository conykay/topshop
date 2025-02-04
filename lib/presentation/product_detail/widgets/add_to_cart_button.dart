import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/helper/product/product_price_helper.dart';
import 'package:topshop/common/widgets/button/basic_reactive_button.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/product_quantity_cubit.dart';

class AddToCartButton extends StatelessWidget {
  final ProductEntity product;
  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: BasicReactiveButton(
        onPressed: () {},
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
    );
  }
}
