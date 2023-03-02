// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RealEstateModel _$$_RealEstateModelFromJson(Map<String, dynamic> json) =>
    _$_RealEstateModel(
      addvertiser: json['addvertiser'] as int,
      estate_name: json['estate_name'] as String,
      estate_description: json['estate_description'] as String,
      owner_national_number: json['owner_national_number'] as String,
      estate_type: json['estate_type'] as String,
      number_of_facilities: json['number_of_facilities'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      optional_details: json['optional_details'] as String,
      estate_status: json['estate_status'] as String,
      map_location: json['map_location'] as String,
    );

Map<String, dynamic> _$$_RealEstateModelToJson(_$_RealEstateModel instance) =>
    <String, dynamic>{
      'addvertiser': instance.addvertiser,
      'estate_name': instance.estate_name,
      'estate_description': instance.estate_description,
      'owner_national_number': instance.owner_national_number,
      'estate_type': instance.estate_type,
      'number_of_facilities': instance.number_of_facilities,
      'state': instance.state,
      'city': instance.city,
      'location': instance.location,
      'price': instance.price,
      'optional_details': instance.optional_details,
      'estate_status': instance.estate_status,
      'map_location': instance.map_location,
    };
