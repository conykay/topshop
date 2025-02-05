import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_req.dart';

abstract class CartFirebaseService {
  Future<Either> addToCart({required AddToCartReq cartItem});
  Future<Either> getCartItems();
}

class CartFirebaseServiceImp extends CartFirebaseService {
  @override
  Future<Either> addToCart({required AddToCartReq cartItem}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .add(cartItem.toMap());
      return Right('Cart Item added successfully');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getCartItems() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }
}
