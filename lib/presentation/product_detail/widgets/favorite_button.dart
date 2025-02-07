import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/data/products/models/product_model.dart';
import 'package:topshop/domain/products/entities/product_entity.dart';
import 'package:topshop/presentation/product_detail/bloc/add_remove_cubit.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity product;
  const FavoriteButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => context
            .read<FavoritesCubit>()
            .addRemoveFavorites(product: product.toModel()),
        icon: Icon(Icons.import_contacts));
  }
}
