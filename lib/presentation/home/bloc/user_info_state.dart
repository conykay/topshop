import 'package:topshop/domain/auth/entity/user.dart';

abstract class UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  final UserEntity user;

  UserInfoLoaded({required this.user});
}

class UserInfoError extends UserInfoState {
  final String? error;

  UserInfoError({this.error});
}
