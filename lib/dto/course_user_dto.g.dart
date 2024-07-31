// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseUserDTOImpl _$$CourseUserDTOImplFromJson(Map<String, dynamic> json) =>
    _$CourseUserDTOImpl(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      name: json['name'] as String,
      profileImagePath: json['profileImagePath'] as String,
      editPermission:
          $enumDecode(_$EditPermissionEnumMap, json['editPermission']),
    );

Map<String, dynamic> _$$CourseUserDTOImplToJson(_$CourseUserDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'profileImagePath': instance.profileImagePath,
      'editPermission': _$EditPermissionEnumMap[instance.editPermission]!,
    };

const _$EditPermissionEnumMap = {
  EditPermission.READ: 'READ',
  EditPermission.EDIT: 'EDIT',
  EditPermission.ADMIN: 'ADMIN',
};
