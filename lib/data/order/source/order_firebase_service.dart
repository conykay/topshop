import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/add_to_cart_req.dart';
import '../models/checkout_req.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart({required AddToCartReq cartItem});
  Future<Either> getCartItems();
  Future<Either> removeCartItem({required String itemId});
  Future<Either> checkOutRequest({required CheckoutReq order});
  Future<Either> getOrders();
}

class OrderFirebaseServiceImp extends OrderFirebaseService {
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
      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({'cartItemId': item.id});
        products.add(data);
      }
      return Right(products);
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> removeCartItem({required String itemId}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(itemId)
          .delete();
      return Right('Cart item deleted successfully');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> checkOutRequest({required CheckoutReq order}) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders')
          .add(order.toMap());
      //clear cart
      for (var item in order.items) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.cartItemId)
            .delete();
      }
      return Right('Order registered');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getOrders() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .collection('Orders')
          .orderBy('createdDate')
          .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Failed to retrieve items');
    }
  }
}
