import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../dto/user_response_dto.dart';
import '../utils/dio_client.dart';

class ProfileService {
  final TokenDioClient _dioClient = TokenDioClient();

  final storage = const FlutterSecureStorage();

  Future<UserResponseDto> getProfile() async {
    try {
      String? userId = await storage.read(key: 'userId');
      final response = await _dioClient.dio.get('/users/profile', queryParameters: {'userId': userId});

      if (response.statusCode == 200 || response.statusCode == 206) {
        final data = response.data['data'];
        return UserResponseDto(name: data['nickname'], email: data['email'], profileImagePath: data['profileImagePath'] ?? '');
      } else {
        throw Exception('Failed to ProfileService > getProfile: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  void updateName(String name) async {
    try {
      String? userId = await storage.read(key: 'userId');
      await _dioClient.dio.post('/users/name', queryParameters: {'userId': userId, 'name': name});
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  void updateProfileImagePath(String profileImagePath) async {
    try {
      String? userId = await storage.read(key: 'userId');
      await _dioClient.dio.post('/users/profile-photo', queryParameters: {'userId': userId, 'file': profileImagePath});
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }
}
