import 'package:flutter/material.dart';
import 'package:topshop/common/helper/nav/app_navigation.dart';
import 'package:topshop/presentation/search/pages/search_product.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        readOnly: true,
        onTap: () {
          AppNavigator.push(context, SearchProductsPage());
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search',
        ),
      ),
    );
  }
}
