// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      user: json['user'] as int?,
      first_name: json['first_name'] as String,
      second_name: json['second_name'] as String,
      thired_name: json['thired_name'] as String,
      forth_name: json['forth_name'] as String,
      national_number: json['national_number'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'first_name': instance.first_name,
      'second_name': instance.second_name,
      'thired_name': instance.thired_name,
      'forth_name': instance.forth_name,
      'national_number': instance.national_number,
      'phone': instance.phone,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'state': instance.state,
      'city': instance.city,
    };
