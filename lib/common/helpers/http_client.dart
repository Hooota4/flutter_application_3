import 'dart:io';

import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: "http://172.16.60.66:8000/requests/",
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
));