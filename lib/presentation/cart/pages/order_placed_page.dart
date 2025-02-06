import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/common/widgets/button/basic_app_button.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/presentation/home/pages/home.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.celebration,
                    size: 60,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.local_shipping_outlined,
                    size: 200,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order placed Successfuly.\nThank you !',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    BasicButton(
                        onPressed: () {
                          AppNavigator.pushAndRemove(context, HomePage());
                        },
                        title: 'Finish'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
