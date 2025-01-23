import 'package:dartz/dartz.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';

abstract class AuthRepositiory {
  Future<Either> signup(UserCreationReq user);
}
