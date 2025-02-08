import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/helper/product/product_price_helper.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/product_detail/pages/product_details.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, ProductDetailPage(product: product));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl:
                    ImageDisplayHelper.displayProductImage(product.images[0]),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.image_not_supported),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ProductPriceHelper.productPrice(product: product)
                              .toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          product.discountedPrice == 0
                              ? ''
                              : '\$${product.price}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
