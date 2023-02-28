import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
    required String? token,
    required bool? isLoggedIn,
    required User? user,
  }) = _Auth;
}
