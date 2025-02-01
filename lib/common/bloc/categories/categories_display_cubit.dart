import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/category/usecases/get_categories.dart';

import '../../../service_locator.dart';
import 'categories_display_state.dart';

class CategoriesDisplayCubit extends Cubit<CategoryDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void getCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error) => emit(CategoriesFailure(error: error)),
      (data) => emit(CategoriesLoaded(categories: data)),
    );
  }
}
