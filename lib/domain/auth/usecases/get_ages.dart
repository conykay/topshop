import 'package:dartz/dartz.dart';
import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class GetAgesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepositiory>().getAges();
  }
}
