import 'dart:convert';

import 'package:topshop/domain/auth/entities/user.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gender,
  });
  Map<String, dynamic> toMap() => <String, dynamic>{
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'image': image,
        'gender': gender,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        userId: map['userId'] ?? '',
        firstName: map['firstName'] as String,
        lastName: map['lastName'] as String,
        email: map['email'] as String,
        image: map['image'] ?? '',
        gender: map['gender'] as int,
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() => UserEntity(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        image: image,
        gender: gender,
      );
}
