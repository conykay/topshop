import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:topshop/data/auth/models/user_login_req.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSignInReq user);
  Future<Either> sendPaswordResetEmail(String email);
  Future<bool> isLoggedIn();

  Future<Either> getAges();
}

class AuthFirebaseImp extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var dataReceived =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      var userData = {
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'gender': user.gender,
        'age': user.age,
      };
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(dataReceived.user!.uid)
          .set(userData);

      return Right('User created successfully');
    } on FirebaseAuthException catch (e) {
      String error = 'An error occurred';

      if (e.code == 'weak-password') {
        error = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email';
      }

      return Left(error);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return Left('please try again');
    }
  }

  @override
  Future<Either> signin(UserSignInReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return Right('User signed in successfully');
    } on FirebaseAuthException catch (e) {
      String message = e.code;

      if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> sendPaswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right('Email sent succesfully');
    } catch (e) {
      return Left('Somethig went wrong try again');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
