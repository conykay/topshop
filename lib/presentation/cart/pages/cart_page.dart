import 'package:flutter/material.dart';
import 'package:topshop/common/widgets/appbar/app_bar.dart';

import '../widgets/cart_Item_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: Text('Cart')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => CartItemCard(),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10),
      ),
    );
  }
}
