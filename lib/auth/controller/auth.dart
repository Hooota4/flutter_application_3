import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/models/auth_model.dart';
import 'package:flutter_application_3/auth/models/response_model.dart';
import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Auth build() => const Auth(token: null, isLoggedIn: false, user: null);

  void login({required String username, required String password}) async {
    try {
      final res = await dio.post(
        '/login',
        data: FormData.fromMap({'username': username, 'password': password}),
      );

      final data = ResponseModel.fromJson(res.data).data;
      if (data != null) {
        state = Auth(token: data['token'], isLoggedIn: true, user: null);
      }
    } catch (e) {
      return;
    }
  }

  void register(User user) async {
    try {
      final res = await dio.post(
        '/register',
        data: FormData.fromMap(user.toJson()),
      );

      final data = ResponseModel.fromJson(res.data).data;
      if (data != null) {
        state = Auth(token: data['token'], isLoggedIn: true, user: null);
      }
    } catch (e) {
      return;
    }
  }

  void logout() {}
}

final dio = Dio(BaseOptions(
  baseUrl: "http://192.168.1.104:8000/requests/",
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5),
  headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
));
