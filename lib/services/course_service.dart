import 'dart:io';

import 'package:cose_front/dto/course_preview_dto.dart';
import 'package:cose_front/dto/course_user_dto.dart';
import 'package:cose_front/dto/place_response_dto.dart';
import '../dto/course_response_dto.dart';
import '../enums/EditPermission.dart';
import '../utils/dio_client.dart';
import '../utils/formatter.dart';

class CourseService {
  final TokenDioClient _dioClient = TokenDioClient();

  Future<void> createCourse(String title, List<PlaceResponseDto> places, double cameraLongitude, double cameraLatitude) async {
    try {
      List<Map<String, dynamic>> placesData = places.map((place) => place.toServerData()).toList();

      Map<String, dynamic> data = {
        'courseName': title,
        "places": placesData,
        "x": cameraLongitude,
        "y": cameraLatitude,
        "previewImagePath": '',
      };

      await _dioClient.dio.post('/courses', data: data);

    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<List<CoursePreviewDto>> getCourses() async {
    try {
      final response = await _dioClient.dio.get('/courses', queryParameters: {
        'page': 1,
        'size': 10,
      });

      if (response.statusCode == 200 || response.statusCode == 206) {
        return (response.data['data'] as List).map((item) => CoursePreviewDto(
          id: item['courseId'],
          title: item['courseName'],
          previewImagePath: item['previewImagePath'],
          lastUpdated: formatTimeAgo(item['lastUpdated']),
        )).toList();
      } else {
        throw Exception('Failed to CourseService > getCourses: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<CourseResponseDto> getCourseById(int courseId) async {
    try {
      final response = await _dioClient.dio.get('/courses/$courseId');

      if (response.statusCode == 200 || response.statusCode == 206) {
        var data = response.data['data'];

        return CourseResponseDto(
          id: data['courseId'],
          title: data['courseName'],

          places: (data['places'] as List).map((placeData) => PlaceResponseDto(
            id: placeData['placeId'],
            address: placeData['address'],
            name: placeData['placeName'],
            url: placeData['placeUrl'],
            category: placeData['categoryGroupName'],
            longitude: placeData['x'],
            latitude: placeData['y'],
            placeOrder: placeData['placeOrder'],
            content: placeData['content'],
          )).toList(),

          members: (data['members'] as List).map((memberData) => CourseUserDTO(
            id: memberData['courseUserId'],
            name: memberData['nickname'],
            email: memberData['email'],
            profileImagePath: memberData['profileImagePath'] ?? '',
            editPermission: EditPermission.values.firstWhere((e) => e.toString().split('.').last == memberData['editPermission'], orElse: () => EditPermission.READ),
          )).toList(),

          cameraLongitude: data['x'],
          cameraLatitude: data['y'],
          previewImagePath: data['previewImagePath'],
        );
      } else {
        throw Exception('Failed to CourseService > getCourseById: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<PlaceResponseDto> updatePlaceContent(int placeId, String content) async {
    try {
      final response = await _dioClient.dio.patch('/place/$placeId', data: content);

      if (response.statusCode == 200 || response.statusCode == 206) {
        return PlaceResponseDto.fromServerData(response.data['data']);
      } else {
        throw Exception('Failed to CourseService > updatePlaceContent: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> updatePreviewImagePath(int courseId, String previewImagePath) async {
    try {
      await _dioClient.dio.patch('/courses/image/$courseId', data: previewImagePath);
    } catch (e, stackTrace) {
        stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
        stderr.writeln('스택 트레이스:');
        stderr.writeln(stackTrace.toString());
        rethrow;
    }
  }
}


