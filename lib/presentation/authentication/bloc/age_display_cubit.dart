import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/domain/auth/usecases/get_ages.dart';
import 'package:topshop/presentation/authentication/bloc/age_display_state.dart';

import '../../../service_locator.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayState> {
  AgeDisplayCubit() : super(AgeLoading());

  void getAges() async {
    final dataReceived = await sl<GetAgesUseCase>().call();

    dataReceived.fold(
      (message) {
        emit(AgeError(message: message));
      },
      (data) {
        emit(AgeLoaded(data: data));
      },
    );
  }
}
