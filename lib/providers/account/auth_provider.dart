import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import '../../enums/LoginPlatform.dart';
import '../../model/login_status.dart';
import '../../services/auth/local_login_service.dart';
import '../../services/auth/sign_up_service.dart';
import '../../services/auth/social_login/google_login_service.dart';
import '../../services/auth/social_login/kakao_login_service.dart';
import '../../services/auth/social_login/naver_login_service.dart';
import '../../services/auth/social_login/social_login_service.dart';
import '../../services/storage_service.dart';
import '../../widgets/custom_toast.dart';

final authProvider = ChangeNotifierProvider<AuthNotifier>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends ChangeNotifier {
  final SignUpService signUpService = SignUpService();
  final LocalLoginService localLoginService = LocalLoginService();

  final Map<LoginPlatform, SocialLoginService> socialLoginServices = {
    LoginPlatform.kakao: KakaoLoginService(),
    LoginPlatform.naver: NaverLoginService(),
    LoginPlatform.google: GoogleLoginService(),
  };

  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final GetLoginStatusFromStorage getUserFromStorage = GetLoginStatusFromStorage();


  Future<void> signUp(BuildContext context, String email, String password, String name) async {
    try {
      await signUpService.signUp(email, password, name);
      customToast(context, '회원 가입이 성공하였습니다. 로그인을 시도해 주세요.');
      context.go('/login');
    } catch (e) {
      customToast(context, '회원 가입에 실패하였습니다. 다시 시도해 주세요.');
    }
  }


  Future<void> localLogin(BuildContext context, String email, String password) async {
    try {
      await localLoginService.login(email, password);
      await _updateLoginState(email, LoginPlatform.local);
      context.go('/');
    } catch (e) {
      customToast(context, '로그인에 실패하였습니다. 다시 시도해 주세요.');
    }
  }


  Future<void> socialLogin(BuildContext context, LoginPlatform platform) async {
    final loginResult = await socialLoginServices[platform]!.login();
    await _handleSuccessfulLogin(context, loginResult, platform);
  }


  Future<void> _handleSuccessfulLogin(BuildContext context, Map<String, String> result, LoginPlatform platform) async {
    if (result.containsKey('email')) {
      await _updateLoginState(result['email']!, platform);
      context.go('/');
    } else if (result.containsKey('error')) {
      customToast(context, result['error']!);
    }
  }


  Future<void> _updateLoginState(String email, LoginPlatform platform) async {
    var userModel = LoginStatus(loginStatus: true, loginPlatform: platform);
    var val = jsonEncode(userModel.toJson());
    await storage.write(key: 'login', value: val);
    await storage.write(key: 'email', value: email);
  }


  Future<void> logout(BuildContext context) async {
    try {
      await _performLogout();
      await _clearStorageOnLogout();
      context.go('/');
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }


  Future<void> _performLogout() async {
    LoginPlatform platform = await getUserFromStorage.getLoginPlatformFromStorage();
    final service = socialLoginServices[platform];
    if (service != null) {
      await service.logout();
    }
  }


  Future<void> _clearStorageOnLogout() async {
    await storage.delete(key: 'login');
    await storage.delete(key: 'userId');
    await storage.delete(key: 'token');
  }
}