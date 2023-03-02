import 'package:freezed_annotation/freezed_annotation.dart';

part 'real_estate_model.freezed.dart';
part 'real_estate_model.g.dart';

@freezed
class RealEstateModel with _$RealEstateModel {
  const factory RealEstateModel({
    required int addvertiser,
    required String estate_name,
    required String estate_description,
    required String owner_national_number,
    required String estate_type,
    required String number_of_facilities,
    required String state,
    required String city,
    required String location,
    required String price,
    required String optional_details,
    required String estate_status,
    // required String estate_image1,
    // required String estate_image2,
    // required String estate_image3,
    // required String authentication_image,
    required String map_location,
  }) = _RealEstateModel;

  factory RealEstateModel.fromJson(Map<String, Object?> json) => _$RealEstateModelFromJson(json);
}
