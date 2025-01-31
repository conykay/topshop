import 'package:dartz/dartz.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';
import 'package:topshop/data/auth/models/user_login_req.dart';

abstract class AuthRepositiory {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSignInReq user);
  Future<Either> sendPaswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<Either> getAges();
}
