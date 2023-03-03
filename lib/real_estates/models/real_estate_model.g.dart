// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RealEstateModel _$$_RealEstateModelFromJson(Map<String, dynamic> json) =>
    _$_RealEstateModel(
      id: json['id'] as int,
      advertiser: json['advertiser'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      nationalID: json['nationalID'] as String,
      facilitiesNum: json['facilitiesNum'] as String,
      type: json['type'] as String,
      operation: json['operation'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      location: json['location'] as String,
      price: json['price'] as String,
      approval: json['approval'] as String,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RealEstateModelToJson(_$_RealEstateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advertiser': instance.advertiser,
      'title': instance.title,
      'description': instance.description,
      'nationalID': instance.nationalID,
      'facilitiesNum': instance.facilitiesNum,
      'type': instance.type,
      'operation': instance.operation,
      'state': instance.state,
      'city': instance.city,
      'location': instance.location,
      'price': instance.price,
      'approval': instance.approval,
      'images': instance.images,
    };
