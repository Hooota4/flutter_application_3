import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/add/models/real_estate_model.dart';
import 'package:flutter_application_3/auth/models/auth_model.dart';
import 'package:flutter_application_3/auth/models/response_model.dart';
import 'package:flutter_application_3/auth/models/user_model.dart';
import 'package:flutter_application_3/common/http_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estate_controller.g.dart';

@riverpod
class RealEstateController extends _$RealEstateController {
  @override
  Auth build() => const Auth(token: null, isLoggedIn: false, user: null);

  Future<bool> addRealEstate({required RealEstateModel realEstate, List<XFile>? images = const []}) async {
    try {
      final jsonData = realEstate.toJson();
      jsonData['estate_image1'] = await MultipartFile.fromFile(
        File(images![0].path).path,
        filename: File(images[0].path).path.split('/').last,
      );
      jsonData['estate_image2'] = await MultipartFile.fromFile(
        File(images[1].path).path,
        filename: File(images[1].path).path.split('/').last,
      );
      jsonData['estate_image3'] = await MultipartFile.fromFile(
        File(images[2].path).path,
        filename: File(images[2].path).path.split('/').last,
      );
      jsonData['authentication_image'] = await MultipartFile.fromFile(
        File(images[3].path).path,
        filename: File(images[3].path).path.split('/').last,
      );

      final res = await dio.post('/adding_estate',
          data: FormData.fromMap(jsonData),
          options: Options(headers: {
            'Authorization': 'bccea46620d3dd1d238b0d45f9cd39e2cb607b22',
          }));

      print(res);
      final data = ResponseModel.fromJson(res.data).data;
      state = Auth(token: data['token'], isLoggedIn: true, user: null);
      return true;
    } catch (e) {
      return false;
    }
  }

  void register(User user) async {
    try {
      final res = await dio.post(
        '/register',
        data: FormData.fromMap(user.toJson()),
      );

      final data = ResponseModel.fromJson(res.data).data;
      state = Auth(token: data['token'], isLoggedIn: true, user: null);
    } catch (e) {
      return;
    }
  }

  void logout() {
    if (state.isLoggedIn ?? false) {
      state = const Auth(token: null, isLoggedIn: false, user: null);
    }
  }
}
