import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../services/auth/reset_password_service.dart';
import '../../widgets/custom_toast.dart';

final resetPasswordProvider = StateNotifierProvider.autoDispose<ResetPasswordNotifier, String>((ref) {
  return ResetPasswordNotifier('');
});

class ResetPasswordNotifier extends StateNotifier<String> {
  final resetPasswordService = ResetPasswordService();

  ResetPasswordNotifier(super.state);

  Future<bool> sendEmailVerificationCode(BuildContext context, String email) async {
    try {
      await resetPasswordService.sendEmailVerificationCode(email);
      state = email;
      customToast(context, "입력하신 주소로 이메일을 발송하였습니다.");
      return true;
    } catch(e) {
      customToast(context, "이메일 전송 실패, 잠시 후 재시도 바랍니다");
      return false;
    }
  }

  Future<bool> checkEmailVerificationCode(BuildContext context, String code) async {
    try {
      await resetPasswordService.checkEmailVerificationCode(state, code);
      customToast(context, "인증이 완료되었습니다.");
      return true;
    } catch (e) {
      customToast(context, "이메일 인증 실패, 잠시 후 재시도 바랍니다");
      return false;
    }
  }

  Future<bool> resetPassword(BuildContext context, String newPassword) async {
    try {
      await resetPasswordService.resetPassword(state, newPassword);
      customToast(context, "비밀번호가 성공적으로 변경되었습니다.");
      return true;
    } catch (e) {
      customToast(context, "비밀번호 재설정 실패, 잠시 후 재시도 바랍니다");
      return false;
    }
  }
}
