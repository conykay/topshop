import 'package:flutter/material.dart';
import 'package:topshop/common/helper/images/image_display.dart';
import 'package:topshop/common/helper/product/product_color_helper.dart';
import 'package:topshop/domain/cart/entities/cart_item_entity.dart';

import '../../../core/configs/theme/app_colors.dart';

class CartItemCard extends StatelessWidget {
  final CartItemEntity item;
  const CartItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      ImageDisplayHelper.displayProductImage(item.productImage),
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.productTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$ ${item.totalPrice}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: 'Size: ', children: [
                          TextSpan(
                              text: item.productSize,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16))
                        ]),
                        style: TextStyle(fontSize: 14),
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(text: 'Color: ', children: [
                              TextSpan(
                                  text: item.productColor.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16))
                            ]),
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(width: 5),
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              color: ProductColorHelper.color(
                                hex: item.productColor.hex,
                              ),
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          SizedBox(width: 5),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(text: 'Price: ', children: [
                          TextSpan(
                              text: '\$${item.productPrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ))
                        ]),
                        style: TextStyle(fontSize: 14),
                      ),
                      Text.rich(
                        TextSpan(text: 'Ammount: ', children: [
                          TextSpan(
                              text: item.productQuantity.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ))
                        ]),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item.createdDate.toDate().toString(),
                          style: TextStyle(fontSize: 10),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.cancel_outlined,
                            color: Colors.redAccent,
                          ),
                        )
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
