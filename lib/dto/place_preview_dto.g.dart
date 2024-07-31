// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_preview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlacePreviewDtoImpl _$$PlacePreviewDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PlacePreviewDtoImpl(
      name: json['name'] as String,
      url: json['url'] as String,
      category: json['category'] as String?,
      address: json['address'] as String,
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlacePreviewDtoImplToJson(
        _$PlacePreviewDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'category': instance.category,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
    };
