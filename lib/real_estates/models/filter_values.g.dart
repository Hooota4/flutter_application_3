// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterValuesModel _$$_FilterValuesModelFromJson(Map<String, dynamic> json) =>
    _$_FilterValuesModel(
      cities:
          (json['cities'] as List<dynamic>).map((e) => e as String).toList(),
      states:
          (json['states'] as List<dynamic>).map((e) => e as String).toList(),
      maxPrice: json['maxPrice'] as int,
    );

Map<String, dynamic> _$$_FilterValuesModelToJson(
        _$_FilterValuesModel instance) =>
    <String, dynamic>{
      'cities': instance.cities,
      'states': instance.states,
      'maxPrice': instance.maxPrice,
    };
