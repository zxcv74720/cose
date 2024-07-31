// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_preview_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoursePreviewDtoImpl _$$CoursePreviewDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$CoursePreviewDtoImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      previewImagePath: json['previewImagePath'] as String,
      lastUpdated: json['lastUpdated'] as String,
    );

Map<String, dynamic> _$$CoursePreviewDtoImplToJson(
        _$CoursePreviewDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'previewImagePath': instance.previewImagePath,
      'lastUpdated': instance.lastUpdated,
    };
