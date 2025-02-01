import 'package:topshop/domain/category/entity/category.dart';

abstract class CategoryDisplayState {}

class CategoriesLoading extends CategoryDisplayState {}

class CategoriesLoaded extends CategoryDisplayState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({required this.categories});
}

class CategoriesFailure extends CategoryDisplayState {
  final String? error;

  CategoriesFailure({this.error});
}
