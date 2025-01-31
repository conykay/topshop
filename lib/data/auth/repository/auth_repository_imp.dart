import 'package:dartz/dartz.dart';
import 'package:topshop/data/auth/models/user.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';
import 'package:topshop/data/auth/models/user_login_req.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';
import '../source/auth_firebase_service.dart';

class AuthRepositoryImp extends AuthRepositiory {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSignInReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPaswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPaswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var userData = await sl<AuthFirebaseService>().getUser();
    return userData.fold(
      (e) => Left(e),
      (data) => Right(
        UserModel.fromMap(data).toEntity(),
      ),
    );
  }
}
