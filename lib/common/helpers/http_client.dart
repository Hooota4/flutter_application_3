import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/auth/controller/auth.dart';
import 'package:flutter_application_3/common/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_client.g.dart';

@riverpod
Dio dioHttpClient(DioHttpClientRef ref) {
  final token = ref.watch(authCacheProvider).token;
  final client = Dio(
    BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
    ),
  );

  if (token != null) client.options.headers.addEntries({'Authorization': 'Token $token'}.entries);

  return client;
}

// final httpClientProvider = Provider<Dio>((ref) {
//   final token = ref.watch(authCacheProvider.notifier);
//   final client = Dio(
//     BaseOptions(
//       baseUrl: apiUrl,
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//       headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
//     ),
//   );

//   if (token != null) client.options.headers.addEntries({'Authorization': 'Token $token'}.entries);

//   return client;
// });

final dio = Dio(BaseOptions(
  baseUrl: apiUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
));
