import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/add/models/real_estate_model.dart';
import 'package:flutter_application_3/auth/models/response_model.dart';
import 'package:flutter_application_3/common/http_client.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'real_estate_controller.g.dart';

@riverpod
class RealEstateController extends _$RealEstateController {
  @override
  void build() {}

  Future<bool> addRealEstate({
    required RealEstateModel realEstate,
    List<XFile>? images = const [],
  }) async {
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

      final res = await dio.post(
        '/adding_estate',
        data: FormData.fromMap(jsonData),
        options: Options(headers: {'Authorization': 'Token bccea46620d3dd1d238b0d45f9cd39e2cb607b22'}),
      );

      return ResponseModel.fromJson(res.data).success;
    } catch (e) {
      return false;
    }
  }
}
