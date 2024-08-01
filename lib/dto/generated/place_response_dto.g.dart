// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../place_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceResponseDtoImpl _$$PlaceResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceResponseDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String,
      category: json['category'] as String,
      address: json['address'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      placeOrder: (json['placeOrder'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$PlaceResponseDtoImplToJson(
        _$PlaceResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'category': instance.category,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'placeOrder': instance.placeOrder,
      'content': instance.content,
    };
