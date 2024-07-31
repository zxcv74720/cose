// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseResponseDtoImpl _$$CourseResponseDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CourseResponseDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      places: (json['places'] as List<dynamic>)
          .map((e) => PlaceResponseDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>)
          .map((e) => CourseUserDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      cameraLatitude: (json['cameraLatitude'] as num).toDouble(),
      cameraLongitude: (json['cameraLongitude'] as num).toDouble(),
      previewImagePath: json['previewImagePath'] as String,
    );

Map<String, dynamic> _$$CourseResponseDtoImplToJson(
        _$CourseResponseDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'places': instance.places,
      'members': instance.members,
      'cameraLatitude': instance.cameraLatitude,
      'cameraLongitude': instance.cameraLongitude,
      'previewImagePath': instance.previewImagePath,
    };
