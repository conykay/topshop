import 'package:flutter/material.dart';

import '../../../common/helper/nav/app_navigation.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../all_categories/pages/categories_display_page.dart';

class NoItemsWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  const NoItemsWidget({super.key, required this.message, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 150,
            color: Colors.yellowAccent,
          ),
          SizedBox(height: 20),
          Text(
            message,
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
                title: 'Explore Categories'),
          )
        ],
      ),
    );
  }
}
