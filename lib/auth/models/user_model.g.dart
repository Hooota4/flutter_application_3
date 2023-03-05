// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      user: json['user'] as int?,
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String,
      thirdName: json['thirdName'] as String,
      forthName: json['forthName'] as String,
      nationalID: json['nationalID'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'thirdName': instance.thirdName,
      'forthName': instance.forthName,
      'nationalID': instance.nationalID,
      'phone': instance.phone,
      'email': instance.email,
      'state': instance.state,
      'city': instance.city,
    };

_$_UserCredentials _$$_UserCredentialsFromJson(Map<String, dynamic> json) =>
    _$_UserCredentials(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_UserCredentialsToJson(_$_UserCredentials instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
