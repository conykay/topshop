import 'package:dartz/dartz.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';
import '../source/auth_firebase_service.dart';

class AuthRepositoryImp extends AuthRepositiory {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return sl<AuthFirebaseService>().signup(user);
  }
}
