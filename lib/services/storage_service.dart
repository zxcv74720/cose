import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../enums/LoginPlatform.dart';
import '../model/login_status.dart';

class Token {
  final String accessToken;
  final String refreshToken;

  Token({required this.accessToken, required this.refreshToken});

  Map<String, dynamic> toJson() => {
    'accessToken': accessToken,
    'refreshToken': refreshToken,
  };

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}

class GetLoginStatusFromStorage {
  final storage = const FlutterSecureStorage();

  Future<LoginPlatform> getLoginPlatformFromStorage() async {
    String? value = await storage.read(key: 'login');

    if (value != null) {
      Map<String, dynamic> userMap = jsonDecode(value);
      LoginStatus userModel = LoginStatus.fromJson(userMap);
      return userModel.loginPlatform;
    } else {
      return LoginPlatform.none;
    }
  }

  Future<bool> getLoginStatusFromStorage() async {
    String? value = await storage.read(key: 'login');

    if (value != null) {
      Map<String, dynamic> userMap = jsonDecode(value);
      LoginStatus userModel = LoginStatus.fromJson(userMap);
      return userModel.loginStatus;
    } else {
      return false;
    }
  }
}