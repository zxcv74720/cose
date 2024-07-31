// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseDetailDtoImpl _$$CourseDetailDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseDetailDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      places: (json['places'] as List<dynamic>)
          .map((e) => PlaceResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      cameraLatitude: (json['cameraLatitude'] as num).toDouble(),
      cameraLongitude: (json['cameraLongitude'] as num).toDouble(),
      previewImagePath: json['previewImagePath'] as String,
    );

Map<String, dynamic> _$$CourseDetailDtoImplToJson(
        _$CourseDetailDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'places': instance.places,
      'cameraLatitude': instance.cameraLatitude,
      'cameraLongitude': instance.cameraLongitude,
      'previewImagePath': instance.previewImagePath,
    };
