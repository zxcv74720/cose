import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_response_dto.freezed.dart';
part 'place_response_dto.g.dart';

@freezed
class PlaceResponseDto with _$PlaceResponseDto {
  const PlaceResponseDto._();

  const factory PlaceResponseDto({
    required int id,
    required String name,
    required String url,
    required String category,
    required String address,
    required double longitude,
    required double latitude,
    required int placeOrder,
    required String content,
  }) = _PlaceResponseDto;

  factory PlaceResponseDto.fromJson(Map<String, dynamic> json) => _$PlaceResponseDtoFromJson(json);

  Map<String, dynamic> toServerData() {
    return {
      'placeName': name,
      'categoryGroupName': category,
      'x': longitude,
      'y': latitude,
      'address': address,
      'placeUrl': url,
      'placeOrder': placeOrder,
      'content': '',
    };
  }

  factory PlaceResponseDto.fromServerData(Map<String, dynamic> data) {
    return PlaceResponseDto(
      id: data['id'] ?? DateTime.now().millisecondsSinceEpoch,
      name: data['placeName'] ?? '',
      category: data['categoryGroupName'] ?? '',
      longitude: data['x'] ?? 0.0,
      latitude: data['y'] ?? 0.0,
      address: data['address'] ?? '',
      url: data['placeUrl'] ?? '',
      placeOrder: data['placeOrder'] ?? 0,
      content: data['content'] ?? '',
    );
  }
}
