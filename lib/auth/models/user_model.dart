import 'package:freezed_annotation/freezed_annotation.dart';

part "user_model.freezed.dart";
part "user_model.g.dart";

@freezed
class User with _$User {
  const factory User({
    int? id,
    int? user,
    required String first_name,
    required String second_name,
    required String thired_name,
    required String forth_name,
    required String national_number,
    required String phone,
    required String email,
    required String username,
    required String password,
    required String state,
    required String city,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
