import 'package:dartz/dartz.dart';
import 'package:topshop/data/auth/models/user_creation_req.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../core/usecases/usecases.dart';
import '../../../service_locator.dart';

class SignupUseCase extends UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return sl<AuthRepositiory>().signup(params!);
  }
}
