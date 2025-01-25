import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgeDisplayState {}

class AgeLoading extends AgeDisplayState {}

class AgeLoaded extends AgeDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> data;

  AgeLoaded({required this.data});
}

class AgeError extends AgeDisplayState {
  final String message;

  AgeError({required this.message});
}
