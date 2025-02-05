import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';
import 'package:topshop/common/widgets/button/basic_app_button.dart';
import 'package:topshop/domain/cart/entities/cart_item_entity.dart';
import 'package:topshop/presentation/all_categories/pages/categories_display_page.dart';
import 'package:topshop/presentation/cart/bloc/cart_items_state.dart';
import 'package:topshop/presentation/cart/bloc/cart_items_state_cubit.dart';
import 'package:topshop/presentation/cart/widgets/check_out.dart';

import '../widgets/cart_Item_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: Text('Cart')),
      body: BlocProvider(
        create: (context) => CartItemsStateCubit()..getCartItems(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BlocBuilder<CartItemsStateCubit, CartItemsState>(
              builder: (context, state) {
            if (state is LoadingCartItems) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedCartItems) {
              return state.items.isNotEmpty
                  ? Stack(
                      children: [
                        _ItemsListWidget(items: state.items),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CheckOut(items: state.items),
                        )
                      ],
                    )
                  : _NoItemsWidget();
            }
            return Container();
          }),
        ),
      ),
    );
  }
}

class _NoItemsWidget extends StatelessWidget {
  const _NoItemsWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 150,
            color: Colors.yellowAccent,
          ),
          SizedBox(height: 20),
          Text(
            'Your cart is empty',
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
                  title: 'Explore Categories'))
        ],
      ),
    );
  }
}

class _ItemsListWidget extends StatelessWidget {
  final List<CartItemEntity> items;
  const _ItemsListWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.575,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => CartItemCard(item: items[index]),
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: items.length,
      ),
    );
  }
}
