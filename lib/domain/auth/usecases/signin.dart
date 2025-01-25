import 'package:dartz/dartz.dart';
import 'package:topshop/data/auth/models/user_login_req.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../core/usecases/usecases.dart';
import '../../../service_locator.dart';

class SignInUseCase extends UseCase<Either, UserSignInReq> {
  @override
  Future<Either> call({UserSignInReq? params}) async {
    return await sl<AuthRepositiory>().signin(params!);
  }
}
