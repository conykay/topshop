import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsFirebaseService {
  Future<Either> getTopSellingProducts();
  Future<Either> getNewInProducts();
  Future<Either> getCategoryProducts({required String categoryId});
  Future<Either> getSearchedProduct({required String title});
}

class ProductsFirebaseServiceImp extends ProductsFirebaseService {
  @override
  Future<Either> getTopSellingProducts() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 100)
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getNewInProducts() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('createdDate',
              isGreaterThanOrEqualTo:
                  Timestamp.fromDate(DateTime.parse('2025-01-16')))
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getCategoryProducts({required String categoryId}) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return Right(
        returnedData.docs.map((e) => e.data()).toList(),
      );
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getSearchedProduct({required String title}) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('title', isGreaterThanOrEqualTo: title)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }
}
