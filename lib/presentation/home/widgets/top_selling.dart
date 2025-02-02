import 'package:flutter/material.dart';
import 'package:topshop/common/widgets/product/product_card.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topSelling(),
        SizedBox(height: 20),
        _products(),
      ],
    );
  }

  Widget _topSelling() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Top Selling',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _products() {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: 8,
      ),
    );
  }
}
