import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class PasswordResetEmailUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepositiory>().sendPaswordResetEmail(params!);
  }
}
