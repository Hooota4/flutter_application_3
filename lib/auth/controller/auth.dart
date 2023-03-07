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

const nullAuth = Auth(token: null, isLoggedIn: false, user: null);

@riverpod
class AuthCache extends _$AuthCache {
  @override
  Auth build() {
    loadCache();
    return state;
  }

  setCache(Auth auth) {
    pref.setString('auth', jsonEncode(auth));
    state = auth;
  }

  void loadCache() {
    final cachedAuth = pref.getString('auth');
    state = cachedAuth != null ? Auth.fromJson(jsonDecode(cachedAuth)) : nullAuth;
  }

  void clear() {
    pref.remove('auth');
    state = nullAuth;
  }
}

@riverpod
class AuthController extends _$AuthController {
  @override
  Auth build() {
    // load cache
    ref.read(authCacheProvider.notifier);
    return ref.watch(authCacheProvider);
  }

  Future<bool> login(UserCredentials userCredentials) async {
    try {
      final dio = ref.watch(dioHttpClientProvider);

      final res = await dio.post('/login', data: FormData.fromMap(userCredentials.toJson()));

      try {
        final data = ResponseModel.fromJson(res.data);

        final infoUser = User.fromJson(data.data['userInfo'] as Map<String, dynamic>);
        state = Auth(token: data.data!['token'], isLoggedIn: true, user: infoUser);
        log(state.toString());

        // pref.setString('auth', jsonEncode(state));
        ref.read(authCacheProvider.notifier).setCache(state);

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
      final dio = ref.watch(dioHttpClientProvider);

      final res = await dio.post('/register', data: FormData.fromMap(registrationData));

      try {
        final data = ResponseModel.fromJson(res.data);

        final infoUser = User.fromJson(data.data!['info_user'] as Map<String, dynamic>);

        state = Auth(token: data.data!['token'], isLoggedIn: true, user: infoUser);
        log(state.toString());
        ref.read(authCacheProvider.notifier).setCache(state);

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
      ref.read(authCacheProvider.notifier).clear();
      state = const Auth(token: null, isLoggedIn: false, user: null);
    }
    return true;
  }
}
