import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/auth/usecases/is_logged_in.dart';
import 'package:topshop/presentation/spash/bloc/splash_state.dart';

import '../../../service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      await sl<IsLoggedInUseCase>().call()
          ? emit(Authenticated())
          : emit(UnAuthenticated());
    });
  }
}
