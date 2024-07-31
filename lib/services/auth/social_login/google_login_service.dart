import 'dart:convert';
import 'dart:io';

import 'package:cose_front/services/auth/social_login/social_login_service.dart';
import 'package:cose_front/services/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/dio_client.dart';

class GoogleLoginService extends SocialLoginService {
  final DioClient _dioClient = DioClient();
  final storage = const FlutterSecureStorage();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
    serverClientId: '133690703625-4g60lurglg3lfdpfhqb8ggo08ruqju5e.apps.googleusercontent.com',
  );

  @override
  Future<Map<String, String>> login() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      try {
        await _postAuthorizationCode(account!.serverAuthCode);
        return {"email": account!.email};
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
      await _googleSignIn.signOut();
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> _postAuthorizationCode(String? serverAuthCode) async {
    try {
      final response = await _dioClient.dio.post('/auth/google', data: {'authorizationCode': serverAuthCode});

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
