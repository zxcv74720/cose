import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_response_dto.freezed.dart';
part 'generated/user_response_dto.g.dart';

@freezed
class UserResponseDto with _$UserResponseDto {
  const factory UserResponseDto({
    required String email,
    required String name,
    required String profileImagePath,
  }) = _UserResponseDto;

  factory UserResponseDto.fromJson(Map<String, dynamic> json) => _$UserResponseDtoFromJson(json);
}