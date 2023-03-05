// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auth _$$_AuthFromJson(Map<String, dynamic> json) => _$_Auth(
      token: json['token'] as String?,
      isLoggedIn: json['isLoggedIn'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AuthToJson(_$_Auth instance) => <String, dynamic>{
      'token': instance.token,
      'isLoggedIn': instance.isLoggedIn,
      'user': instance.user,
    };
