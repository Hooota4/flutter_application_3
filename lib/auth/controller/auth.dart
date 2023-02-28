import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/models/auth_model.dart';
import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  Auth build() => const Auth(token: null, isLoggedIn: false, user: null);

  void login({required String username, required String password}) async {
    try {
      final token = await dio.post<String>(
        '/login',
        data: FormData.fromMap({'username': username, 'password': password}),
      );
      state = Auth(token: token.data, isLoggedIn: true, user: null);
      print(state);
    } catch (e) {
      return;
    }
  }

  void register(User user) async {
    try {
      final token = await dio.post<String>(
        '/register',
        data: FormData.fromMap(user.toJson()),
      );
      state = Auth(token: token.data, isLoggedIn: true, user: null);
      print(state);
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
