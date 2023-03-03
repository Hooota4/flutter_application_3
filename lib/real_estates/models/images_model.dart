import 'package:freezed_annotation/freezed_annotation.dart';

part 'images_model.freezed.dart';
part 'images_model.g.dart';

@freezed
class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String url,
    required String type,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, Object?> json) => _$ImageModelFromJson(json);
}
