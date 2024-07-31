import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/EditPermission.dart';

part 'course_user_dto.freezed.dart';
part 'course_user_dto.g.dart';

@freezed
class CourseUserDTO with _$CourseUserDTO {
  const factory CourseUserDTO({
    required int id,
    required String email,
    required String name,
    required String profileImagePath,
    required EditPermission editPermission,
  }) = _CourseUserDTO;

  factory CourseUserDTO.fromJson(Map<String, dynamic> json) => _$CourseUserDTOFromJson(json);
}