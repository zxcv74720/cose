import 'package:cose_front/dto/place_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'course_user_dto.dart';

part 'course_response_dto.freezed.dart';
part 'course_response_dto.g.dart';

@freezed
class CourseResponseDto with _$CourseResponseDto {
  const factory CourseResponseDto({
    required int id,
    required String title,
    required List<PlaceResponseDto> places,
    required List<CourseUserDTO> members,
    required double cameraLatitude,
    required double cameraLongitude,
    required String previewImagePath,
  }) = _CourseResponseDto;

  factory CourseResponseDto.fromJson(Map<String, dynamic> json) => _$CourseResponseDtoFromJson(json);
}