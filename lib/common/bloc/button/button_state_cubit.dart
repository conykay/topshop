import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:topshop/common/bloc/button/button_state.dart';
import 'package:topshop/core/usecases/usecases.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either dataReceived = await usecase.call(params: params);
      dataReceived.fold((error) {
        emit(ButtonFailureState(error));
      }, (data) {
        emit(ButtonSuccessSate());
      });
    } catch (e) {
      emit(ButtonFailureState(e.toString()));
    }
  }
}
