import 'dart:convert';
import 'dart:io';

import 'package:cose_front/services/auth/social_login/social_login_service.dart';
import 'package:cose_front/services/storage_service.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../utils/dio_client.dart';

class NaverLoginService extends SocialLoginService {
  final DioClient _dioClient = DioClient();
  final storage = const FlutterSecureStorage();

  @override
  Future<Map<String, String>> login() async {
    try {
      await FlutterNaverLogin.logIn();

      final NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
      final NaverAccountResult account = await FlutterNaverLogin.currentAccount();
      String? email = account.email;

      try {
        await _sendLoginInfoToServer(token.accessToken);
        return {"email": email};
      } catch (e, stackTrace) {
        logout();
        stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
        stderr.writeln('스택 트레이스:');
        stderr.writeln(stackTrace.toString());
        rethrow;
      }
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await FlutterNaverLogin.logOut();
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> _sendLoginInfoToServer(String accessToken) async {
    try {
      final response = await _dioClient.dio.post('/auth/naver', data: {
        "accessToken": accessToken,
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
