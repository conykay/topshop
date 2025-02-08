import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity product;
  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl:
              ImageDisplayHelper.displayProductImage(product.images[index]),
          imageBuilder: (context, provider) {
            return Container(
              width: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: provider,
                ),
              ),
            );
          },
          progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(value: progress.progress)),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: product.images.length,
      ),
    );
  }
}
