import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/place_preview_dto.freezed.dart';
part 'generated/place_preview_dto.g.dart';

@freezed
class PlacePreviewDto with _$PlacePreviewDto {
  const factory PlacePreviewDto({
    required String name,
    required String url,
    String? category,
    required String address,
    required double longitude,
    required double latitude,
  }) = _PlacePreviewDto;

  factory PlacePreviewDto.fromJson(Map<String, dynamic> json) => _$PlacePreviewDtoFromJson(json);
}
