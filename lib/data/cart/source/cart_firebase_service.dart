import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_req.dart';

abstract class CartFirebaseService {
  Future<Either> addToCart({required AddToCartReq cartItem});
}

class CartFirebaseServiceImp extends CartFirebaseService {
  @override
  Future<Either> addToCart({required AddToCartReq cartItem}) async {
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Cart')
          .add(cartItem.toMap());
      return Right('Cart Item added successfully');
    } catch (e) {
      return Left('Please try again');
    }
  }
}
