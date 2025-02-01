import 'package:dartz/dartz.dart';
import 'package:topshop/data/category/models/category_model.dart';
import 'package:topshop/data/category/source/category_firebase_service.dart';
import 'package:topshop/domain/category/repository/categories.dart';

import '../../../service_locator.dart';

class CategoryRepositoryImp extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error) => Left(error),
      (data) => Right(
        List.from(data)
            .map((e) => CategoryModel.fromMap(e).toEntity())
            .toList(),
      ),
    );
  }
}
