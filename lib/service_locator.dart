import 'package:get_it/get_it.dart';
import 'package:topshop/data/auth/repository/auth_repository_imp.dart';
import 'package:topshop/data/auth/source/auth_firebase_service.dart';
import 'package:topshop/domain/auth/repository/auth.dart';
import 'package:topshop/domain/auth/usecases/get_ages.dart';
import 'package:topshop/domain/auth/usecases/password_reset_email.dart';
import 'package:topshop/domain/auth/usecases/signin.dart';
import 'package:topshop/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependecies() async {
  // services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseImp());

  // repositories

  sl.registerSingleton<AuthRepositiory>(AuthRepositoryImp());

  // usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<PasswordResetEmailUseCase>(PasswordResetEmailUseCase());
}
