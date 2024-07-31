import 'package:flutter/material.dart';

import '../services/auth/sign_up_service.dart';

String? validateName(FocusNode focusNode, String? value) {
  if (value == null || value.length < 2 || value.length > 15) {
    focusNode.requestFocus();
    return '2자 이상 15자 이내로 입력하세요';
  } else {
    return null; // 유효성 검사를 통과했을 때는 null을 반환
  }
}

Future<String?> validateSignUpEmail(FocusNode focusNode, String? value) async {
  final signUpService = SignUpService();
  var emailCheckResult = await signUpService.checkUserExistence(value!);

  if (emailCheckResult!) {
    return "이미 사용 중인 이메일입니다 (${value})";
  }
  return null;
}

String? validateEmail(FocusNode focusNode, String? value) {
  if (value == null) {
    return '이메일을 입력해주세요'; // null 값에 대한 처리
  }
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    focusNode.requestFocus();
    return '잘못된 이메일 형식입니다';
  } else {
    return null;
  }
}

String? validatePassword(FocusNode focusNode, String? value) {
  if (value == null) {
    return '비밀번호를 입력해주세요'; // null 값에 대한 처리
  }
  String pattern =
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
  RegExp regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    focusNode.requestFocus();
    return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요';
  } else {
    return null;
  }
}

String? validateConfirmPassword(FocusNode focusNode, String? value, String? check) {
  if (value == null || check == null) {
    return '비밀번호를 입력해주세요'; // 비밀번호 또는 확인 비밀번호가 null인 경우 처리
  }
  if (value != check) {
    focusNode.requestFocus();
    return '비밀번호가 일치하지 않습니다';
  } else {
    return null;
  }
}
