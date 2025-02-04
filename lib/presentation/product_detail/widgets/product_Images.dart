import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity product;
  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => Container(
          width: 225,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                ImageDisplayHelper.displayProductImage(product.images[index]),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: product.images.length,
      ),
    );
  }
}
