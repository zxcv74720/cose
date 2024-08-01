// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../login_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginStatusImpl _$$LoginStatusImplFromJson(Map<String, dynamic> json) =>
    _$LoginStatusImpl(
      loginStatus: json['loginStatus'] as bool,
      loginPlatform: $enumDecode(_$LoginPlatformEnumMap, json['loginPlatform']),
    );

Map<String, dynamic> _$$LoginStatusImplToJson(_$LoginStatusImpl instance) =>
    <String, dynamic>{
      'loginStatus': instance.loginStatus,
      'loginPlatform': _$LoginPlatformEnumMap[instance.loginPlatform]!,
    };

const _$LoginPlatformEnumMap = {
  LoginPlatform.google: 'google',
  LoginPlatform.kakao: 'kakao',
  LoginPlatform.naver: 'naver',
  LoginPlatform.local: 'local',
  LoginPlatform.none: 'none',
};
