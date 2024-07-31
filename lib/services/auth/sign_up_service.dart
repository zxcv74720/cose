import 'dart:io';

import '../../utils/dio_client.dart';

class SignUpService {
  final DioClient _dioClient = DioClient();

  Future<bool> signUp(String email, String password, String nickname) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
        "nickname": nickname,
      };

      final response = await _dioClient.dio.post('/auth/signup', data: data);

      if (response.statusCode == 200 || response.statusCode == 206) {
        return true;
      } else {
        throw Exception('Failed to SignUpService > signUp: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<bool> checkUserExistence(String email) async {
    try {
      final response = await _dioClient.dio.post('/auth/check-email', queryParameters: {'email': email});

      if (response.statusCode == 200 || response.statusCode == 206) {
        return true;
      } else {
        throw Exception('Failed to SignUpService > checkUserExistence: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }
}
