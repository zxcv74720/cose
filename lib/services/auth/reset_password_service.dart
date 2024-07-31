import 'dart:io';

import '../../utils/dio_client.dart';

class ResetPasswordService {
  final DioClient _dioClient = DioClient();

  Future<void> sendEmailVerificationCode(String email) async {
    try {
      await _dioClient.dio.post('/users/password-reset-request', data: {"email": email});
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> checkEmailVerificationCode(String email, String code) async {
    try {
     await _dioClient.dio.post('/users/verify-code', data: {"email": email, "code": code});
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    try {
      await _dioClient.dio.post('/users/reset-password', data: {"email": email, "newPassword": newPassword});
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }
}