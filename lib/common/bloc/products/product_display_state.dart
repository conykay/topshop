import 'package:topshop/domain/products/entities/product_entity.dart';

abstract class ProductsDisplayState {}

class InitialProductState extends ProductsDisplayState {}

class LoadingProducts extends ProductsDisplayState {}

class LoadedProducts extends ProductsDisplayState {
  final List<ProductEntity> products;

  LoadedProducts({required this.products});
}

class ErrorProductsDisplay extends ProductsDisplayState {
  final String? error;

  ErrorProductsDisplay({this.error});
}
