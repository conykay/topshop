import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class ProductsFirebaseService {
  Future<Either> getTopSelling();
}

class ProductsFirebaseServiceImp extends ProductsFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Products')
          .where('salesNumber', isGreaterThanOrEqualTo: 100)
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }
}
