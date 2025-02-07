import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/product_model.dart';

abstract class ProductsFirebaseService {
  Future<Either> getTopSellingProducts();
  Future<Either> getNewInProducts();
  Future<Either> getCategoryProducts({required String categoryId});
  Future<Either> getSearchedProduct({required String title});
  Future<bool> addRemoveFavorites({required ProductModel product});
  Future<bool> isInFavorite({required String productId});
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

  @override
  Future<bool> addRemoveFavorites({required ProductModel product}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var isInFavorites = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: product.productId)
          .get();
      if (isInFavorites.docs.isNotEmpty) {
        await isInFavorites.docs.first.reference.delete();
        return false;
      } else {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Favorites')
            .add(product.toMap());
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isInFavorite({required String productId}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var isInFavorites = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Favorites')
          .where('productId', isEqualTo: productId)
          .get();
      return isInFavorites.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
