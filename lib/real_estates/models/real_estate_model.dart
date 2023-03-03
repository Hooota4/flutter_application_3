import 'package:flutter_application_3/real_estates/models/images_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_estate_model.freezed.dart';
part 'real_estate_model.g.dart';

@freezed
class RealEstateModel with _$RealEstateModel {
  const factory RealEstateModel({
    required int id,
    required int advertiser,
    required String title,
    required String description,
    required String nationalID,
    required String facilitiesNum,
    required String type,
    required String operation,
    required String state,
    required String city,
    required String location,
    required String price,
    required String approval,
    List<ImageModel>? images,
  }) = _RealEstateModel;

  factory RealEstateModel.fromJson(Map<String, Object?> json) => _$RealEstateModelFromJson(json);
}
