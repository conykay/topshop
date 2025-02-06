import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state_cubit.dart';
import 'package:topshop/common/helper/cart/cart_helper.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_reactive_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/data/cart/models/checkout_req.dart';
import 'package:topshop/domain/cart/entities/cart_item_entity.dart';
import 'package:topshop/domain/cart/usecases/checkout.dart';
import 'package:topshop/presentation/cart/pages/order_placed_page.dart';
import 'package:topshop/service_locator.dart';

class CheckOutPage extends StatelessWidget {
  final List<CartItemEntity> items;
  CheckOutPage({super.key, required this.items});

  final TextEditingController _shippingAdress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
        appBar: BasicAppBar(
          title: Text('Checkout'),
          action: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '${items.length} Items',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(text: 'Item: ', children: [
                                  TextSpan(
                                      text: items[index].productTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(text: 'Color: ', children: [
                                  TextSpan(
                                      text: items[index].productColor.title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(text: 'Amount: ', children: [
                                  TextSpan(
                                      text: items[index]
                                          .productQuantity
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))
                                ]),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              '\$${items[index].totalPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(thickness: 1),
                  itemCount: items.length,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        controller: _shippingAdress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.pin_drop),
                          hintText: 'Delivery Adress',
                        ),
                      ),
                      SizedBox(height: 40),
                      Builder(builder: (context) {
                        return BasicReactiveButton(
                          onPressed: () {
                            if (_shippingAdress.text.isNotEmpty) {
                              context
                                  .read<ButtonStateCubit>()
                                  .execute(
                                      usecase: sl<CheckoutUseCase>(),
                                      params: CheckoutReq(
                                        items: items,
                                        createdDate: Timestamp.now(),
                                        shippingAdress: _shippingAdress.text,
                                        itemCount: items.length,
                                        totalPrice:
                                            CartHelper.subTotal(items: items),
                                      ))
                                  .then(
                                (value) {
                                  if (context.mounted) {
                                    AppNavigator.pushReplacement(
                                      context,
                                      OrderPlacedPage(),
                                    );
                                  }
                                },
                              );
                            }
                          },
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${CartHelper.subTotal(items: items)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Checkout',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                              Icon(
                                Icons.exit_to_app,
                                size: 22,
                              ),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
