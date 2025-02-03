import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';

class ProductsSearch extends StatelessWidget {
  const ProductsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        onChanged: (value) {
          value.isEmpty
              ? context.read<ProductDisplayCubit>().intitalState()
              : context.read<ProductDisplayCubit>().getProducts(params: value);
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
