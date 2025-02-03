import 'package:dartz/dartz.dart';

abstract class ProductsRepository {
  Future<Either> getTopSellingProducts();
  Future<Either> getNewInProducts();
}
