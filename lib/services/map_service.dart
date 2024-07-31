import 'dart:convert';
import 'dart:io';
import 'package:cose_front/dto/place_preview_dto.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

import '../utils/dio_client.dart';

class MapService {
  final TokenDioClient _dioClient = TokenDioClient();

  Future<String> getPlaceAddress(NLatLng latLng) async {
    await dotenv.load(fileName: '.env');
    final String? clientId = dotenv.env['NAVER_MAP_CLIENT_ID'];
    final String? clientSecret = dotenv.env['NAVER_MAP_CLIENT_SECRET'];
    final String coords = '${latLng.longitude},${latLng.latitude}';
    final String url = 'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=$coords&sourcecrs=epsg:4326&output=json&orders=roadaddr';

    try {
      Dio dio = Dio();
      dio.options.headers['X-NCP-APIGW-API-KEY-ID'] = clientId;
      dio.options.headers['X-NCP-APIGW-API-KEY'] = clientSecret;

      Response response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 206) {
        final jsonResponse = response.data;

        final results = jsonResponse['results'] as List;

        final region = results[0]['region'] as Map<String, dynamic>;
        final land = results[0]['land'] as Map<String, dynamic>;

        final area1 = region['area1']?['name'] as String?; // 시/도
        final area2 = region['area2']?['name'] as String?; // 구/군
        final area3 = region['area3']?['name'] as String?; // 동/읍/면
        final landName = land['name'] as String?; // 도로명
        final landNumber1 = land['number1'] as String?; // 건물번호 본번
        final landNumber2 = land['number2'] as String?; // 건물번호 부번

        final landAddress = '$area1 $area2 $area3 $landName $landNumber1';
        final completeAddress = landNumber2 != null && landNumber2.isNotEmpty ? '$landAddress-$landNumber2' : landAddress;
        return completeAddress;
      } else {
        throw Exception('Failed to MapService > getPlaceAddress: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<List<PlacePreviewDto>> getPlacesInfo(String address) async {
    try {
      final response = await _dioClient.dio.get('/location/keyword', queryParameters: {'address': address});

      if (response.statusCode == 200 || response.statusCode == 206) {
        final data = jsonDecode(response.data);

        List<PlacePreviewDto> places = [];

        for (var document in data['documents']) {
          String addressName = document['address_name'];
          String name = document['place_name'];
          String url = document['place_url'];
          String category = document['category_group_name'] ?? '';
          double longitude = double.parse(document['x']);
          double latitude = double.parse(document['y']);

          places.add(PlacePreviewDto(
            address: addressName,
            name: name,
            url: url,
            category: category,
            longitude: longitude,
            latitude: latitude,
          ));
        }

        return places;
      } else {
        throw Exception('Failed to MapService > getPlacesInfo: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }
}
