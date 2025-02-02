import 'package:topshop/domain/products/entity/product_entity.dart';

abstract class ProductTopSellingState {}

class LoadingTopSelling extends ProductTopSellingState {}

class LoadedTopSelling extends ProductTopSellingState {
  final List<ProductEntity> topSellingProducts;

  LoadedTopSelling({required this.topSellingProducts});
}

class TopSellingError extends ProductTopSellingState {
  final String? error;

  TopSellingError({this.error});
}
