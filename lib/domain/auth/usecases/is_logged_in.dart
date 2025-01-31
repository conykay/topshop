import 'package:topshop/core/usecases/usecases.dart';
import 'package:topshop/domain/auth/repository/auth.dart';

import '../../../service_locator.dart';

class IsLoggedInUseCase extends UseCase {
  @override
  Future call({params}) {
    return sl<AuthRepositiory>().isLoggedIn();
  }
}
