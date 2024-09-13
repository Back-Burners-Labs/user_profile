// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) =>
    ResetPasswordDto(
      token: json['token'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$ResetPasswordDtoToJson(ResetPasswordDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'password': instance.password,
    };
