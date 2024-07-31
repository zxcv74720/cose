import 'dart:convert';
import 'dart:io';

import 'package:cose_front/services/auth/social_login/social_login_service.dart';
import 'package:cose_front/services/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../../utils/dio_client.dart';

class KakaoLoginService extends SocialLoginService {
  final DioClient _dioClient = DioClient();
  final storage = const FlutterSecureStorage();

  @override
  Future<Map<String, String>> login() async {
    OAuthToken? token;

    if (await isKakaoTalkInstalled()) {
      token = await _attemptKakaoLogin(UserApi.instance.loginWithKakaoTalk);
    }

    token ??= await _attemptKakaoLogin(UserApi.instance.loginWithKakaoAccount);

    User user = await UserApi.instance.me();
    final email = user.kakaoAccount?.email;

    try {
      await _sendLoginInfoToServer(token!);
      return {"email": email!};
    } catch (e, stackTrace) {
      logout();
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
    } catch (e, stackTrace) {
      logout();
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<OAuthToken> _attemptKakaoLogin(Future<OAuthToken> Function() loginMethod) async {
    try {
      return await loginMethod();
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> _sendLoginInfoToServer(OAuthToken token) async {
    try {
      final response = await _dioClient.dio.post('/auth/kakao', data: {"accessToken": token.accessToken});

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
