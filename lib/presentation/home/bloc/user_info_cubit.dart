import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/auth/usecases/get_user.dart';
import 'package:topshop/presentation/home/bloc/user_info_state.dart';

import '../../../service_locator.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit() : super(UserInfoLoading());

  void getUserinfo() async {
    var userData = await sl<GetUserUseCase>().call();
    userData.fold(
      (error) => emit(UserInfoError(error: error)),
      (data) => emit(UserInfoLoaded(user: data)),
    );
  }
}
