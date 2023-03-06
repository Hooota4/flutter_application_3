import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/common/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dio = Dio(BaseOptions(
  baseUrl: apiUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
));

final httpProvider = StateProvider<Dio>((ref) {
  final auth = ref.watch(authControllerProvider.notifier);

  return Dio(
    BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx', 'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'},
    ),
  );
});
