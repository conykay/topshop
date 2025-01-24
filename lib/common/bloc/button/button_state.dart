abstract class ButtonState {}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessSate extends ButtonState {}

class ButtonFailureState extends ButtonState {
  final String errorMessage;

  ButtonFailureState(this.errorMessage);
}
