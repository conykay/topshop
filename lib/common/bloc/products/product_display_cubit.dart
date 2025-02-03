import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/products/product_display_state.dart';
import 'package:topshop/core/usecases/usecases.dart';

class ProductDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase usecase;
  ProductDisplayCubit({required this.usecase}) : super(InitialProductState());

  void getProducts({dynamic params}) async {
    emit(LoadingProducts());
    var products = await usecase.call(params: params);
    products.fold(
      (error) => emit(ErrorProductsDisplay(error: error)),
      (data) => emit(LoadedProducts(products: data)),
    );
  }

  void intitalState() => emit(InitialProductState());
}
