import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:cose_front/dto/place_response_dto.dart';

part 'generated/course_detail_dto.freezed.dart';
part 'generated/course_detail_dto.g.dart';


@freezed
class CourseDetailDto with _$CourseDetailDto {
  const factory CourseDetailDto({
    required int id,
    required String title,
    required List<PlaceResponseDto> places,
    required double cameraLatitude,
    required double cameraLongitude,
    required String previewImagePath,
  }) = _CourseDetailDto;

  factory CourseDetailDto.fromJson(Map<String, dynamic> json) => _$CourseDetailDtoFromJson(json);
}