import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/products/usecases/get_top_selling.dart';
import 'package:topshop/presentation/home/bloc/product_top_selling_state.dart';
import 'package:topshop/service_locator.dart';

class ProductTopSellingCubit extends Cubit<ProductTopSellingState> {
  ProductTopSellingCubit() : super(LoadingTopSelling());

  void getTopSelling() async {
    var products = await sl<GetProductTopSellingUseCase>().call();
    return products.fold(
      (error) => emit(TopSellingError(error: error)),
      (data) => emit(LoadedTopSelling(topSellingProducts: data)),
    );
  }
}
