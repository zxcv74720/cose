import 'dart:convert';
import 'dart:io';

import 'package:cose_front/services/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../utils/dio_client.dart';

class LocalLoginService {
  final DioClient _dioClient = DioClient();
  final storage = const FlutterSecureStorage();

  Future<void> login(String email, String password) async {
    try {
      final response = await _dioClient.dio.post('/auth/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 202 || response.statusCode == 206) {
        final data = response.data;
        final token = Token(
          accessToken: data["data"]["accessToken"],
          refreshToken: data["data"]["refreshToken"],
        );

        await storage.write(key: 'token', value: jsonEncode(token));
        await storage.write(key: 'userId', value: data["data"]["userId"].toString());
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }
}
