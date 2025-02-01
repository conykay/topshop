import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/category/repository/categories.dart';

import '../../../service_locator.dart';

class GetCategoriesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
