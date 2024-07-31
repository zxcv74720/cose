// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseDtoImpl _$$UserResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseDtoImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      profileImagePath: json['profileImagePath'] as String,
    );

Map<String, dynamic> _$$UserResponseDtoImplToJson(
        _$UserResponseDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'profileImagePath': instance.profileImagePath,
    };
