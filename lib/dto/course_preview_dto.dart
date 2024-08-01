import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/course_preview_dto.freezed.dart';
part 'generated/course_preview_dto.g.dart';

@freezed
class CoursePreviewDto with _$CoursePreviewDto {
  const factory CoursePreviewDto({
    required int id,
    required String title,
    required String previewImagePath,
    required String lastUpdated,
  }) = _CoursePreviewDto;

  factory CoursePreviewDto.fromJson(Map<String, dynamic> json) => _$CoursePreviewDtoFromJson(json);
}