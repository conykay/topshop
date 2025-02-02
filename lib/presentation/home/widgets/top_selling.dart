import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/widgets/product/product_card.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
import 'package:topshop/presentation/home/bloc/product_top_selling_cubit.dart';
import 'package:topshop/presentation/home/bloc/product_top_selling_state.dart';

class TopSelling extends StatelessWidget {
  const TopSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductTopSellingCubit()..getTopSelling(),
      child: BlocBuilder<ProductTopSellingCubit, ProductTopSellingState>(
          builder: (context, state) {
        if (state is LoadingTopSelling) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedTopSelling) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topSelling(),
              SizedBox(height: 20),
              _products(products: state.topSellingProducts),
            ],
          );
        }
        return Container();
      }),
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

  Widget _products({required List<ProductEntity> products}) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: products.length,
      ),
    );
  }
}
