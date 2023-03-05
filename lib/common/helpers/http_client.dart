import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/common/constants.dart';

final dio = Dio(BaseOptions(
  baseUrl: apiUrl,
  connectTimeout: const Duration(seconds: 10),
  receiveTimeout: const Duration(seconds: 10),
  headers: {HttpHeaders.userAgentHeader: 'dio', 'common-header': 'xx'},
));
