import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/models/auth_model.dart';
import 'package:flutter_application_3/auth/models/response_model.dart';
import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:flutter_application_3/common/helpers/http_client.dart';
import 'package:flutter_application_3/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Auth build() {
    final cachedAuth = pref.getString('auth');
    return cachedAuth != null ? Auth.fromJson(jsonDecode(cachedAuth)) : const Auth(token: null, isLoggedIn: false, user: null);
  }

  Future<bool> login(UserCredentials userCredentials) async {
    try {
      final res = await dio.post('/login', data: FormData.fromMap(userCredentials.toJson()));

      try {
        final data = ResponseModel.fromJson(res.data);

        final infoUser = User.fromJson(data.data!['userInfo'] as Map<String, dynamic>);
        state = Auth(token: data.data!['token'], isLoggedIn: true, user: infoUser);

        pref.setString('auth', jsonEncode(state));

        return data.success;
      } catch (e, s) {
        log(e.toString());
        log(s.toString());
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> register(User user, UserCredentials userCredentials) async {
    try {
      final registrationData = {...user.toJson(), ...userCredentials.toJson()};

      final res = await dio.post('/register', data: FormData.fromMap(registrationData));

      try {
        final data = ResponseModel.fromJson(res.data);

        final infoUser = User.fromJson(data.data!['info_user'] as Map<String, dynamic>);

        state = Auth(token: data.data!['token'], isLoggedIn: true, user: infoUser);

        pref.setString('auth', jsonEncode(state));

        return data.success;
      } catch (e, s) {
        log(e.toString());
        log(s.toString());
        return false;
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      return Future.value(false);
    }
  }

  bool logout() {
    if (state.isLoggedIn ?? false) {
      pref.remove('auth');
      state = const Auth(token: null, isLoggedIn: false, user: null);
    }
    return true;
  }
}
