import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_cubit.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';
import 'package:topshop/domain/products/entity/product_entity.dart';
import 'package:topshop/domain/products/usecases/get_new_in.dart';
import 'package:topshop/service_locator.dart';

import '../../../common/widgets/product/product_card.dart';

class NewInProducts extends StatelessWidget {
  const NewInProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDisplayCubit(
        usecase: sl<GetNewInUsecase>(),
      )..getProducts(),
      child: BlocBuilder<ProductDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
        if (state is LoadingProducts) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is LoadedProducts) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _NewInText(),
              SizedBox(height: 20),
              _NewInDisplay(products: state.products),
            ],
          );
        }
        return Container();
      }),
    );
  }
}

class _NewInDisplay extends StatelessWidget {
  const _NewInDisplay({required this.products});

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
    ;
  }
}

class _NewInText extends StatelessWidget {
  const _NewInText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'New In',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
          fontSize: 16,
        ),
      ),
    );
  }
}
