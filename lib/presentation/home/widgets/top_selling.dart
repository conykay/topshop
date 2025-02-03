import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/widgets/product/product_card.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/domain/products/usecases/get_top_selling.dart';

import '../../../service_locator.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDisplayCubit(
        usecase: sl<GetProductTopSellingUseCase>(),
      )..getProducts(),
      child: BlocBuilder<ProductDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
        if (state is LoadingProducts) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedProducts) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TopSellingText(),
              SizedBox(height: 20),
              _ProductsDisplayWidget(products: state.products),
            ],
          );
        }
        return Container();
      }),
    );
  }
}

class _ProductsDisplayWidget extends StatelessWidget {
  const _ProductsDisplayWidget({
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductCard(product: products[index]),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: products.length,
      ),
    );
  }
}

class _TopSellingText extends StatelessWidget {
  const _TopSellingText();

  @override
  Widget build(BuildContext context) {
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
}
