import 'package:freezed_annotation/freezed_annotation.dart';

part "user_model.freezed.dart";
part "user_model.g.dart";

@freezed
class User with _$User {
  const factory User({
    int? id,
    int? user,
    required String firstName,
    required String secondName,
    required String thirdName,
    required String forthName,
    required String nationalID,
    required String phone,
    required String email,
    required String state,
    required String city,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

@freezed
class UserCredentials with _$UserCredentials {
  const factory UserCredentials({
    required String username,
    required String password,
  }) = _UserCredentials;

  factory UserCredentials.fromJson(Map<String, Object?> json) => _$UserCredentialsFromJson(json);
}
