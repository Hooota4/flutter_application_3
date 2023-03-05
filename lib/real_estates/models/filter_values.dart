import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_values.freezed.dart';
part 'filter_values.g.dart';

@freezed
class FilterValuesModel with _$FilterValuesModel {
  const factory FilterValuesModel({
    required List<String> cities,
    required List<String> states,
    required int maxPrice,
  }) = _FilterValuesModel;

  factory FilterValuesModel.fromJson(Map<String, Object?> json) => _$FilterValuesModelFromJson(json);
}
