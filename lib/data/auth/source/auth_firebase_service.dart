import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_creation_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
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
}
