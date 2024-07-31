import 'package:cose_front/views/auth/widget/social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../enums/LoginPlatform.dart';
import '../../providers/account/auth_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.2),
            SvgPicture.asset('assets/images/logo_text.svg'),
            SizedBox(height: height * 0.20),
            _buildSocialLoginButtons(context, height),
            SizedBox(height: height * 0.02),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('또는', style: grey13TextStyle),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: height * 0.02),
            GestureDetector(
              onTap: () => context.go('/login/sign-up'),
              child: Container(
                height: height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: black,
                ),
                child: const Center(
                  child: Text('회원가입', style: white14TextStyle),
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '가입하면 코즈의 이용약관, 개인정보 처리방침, 쿠키 사용에 동의하게 됩니다.',
                style: grey13TextStyle,
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('이미 계정이 있으신가요?', style: grey13TextStyle),
                TextButton(
                  onPressed: () => context.go('/login/local'),
                  child: const Text('로그인하기', style: blue13TextStyle),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLoginButtons(BuildContext context, double height) {
    return Consumer(builder: (context, ref, child) {
      return Column(
        children: [
          SocialLoginButton(
            onTap: () => ref.read(authProvider.notifier).socialLogin(context, LoginPlatform.kakao),
            logo: 'assets/images/kakao_logo.svg',
            backgroundColor: kakao,
            textStyle: black14TextStyle,
            text: '카카오로 계속하기',
          ),
          SizedBox(height: height * 0.015),
          SocialLoginButton(
            onTap: () => ref.read(authProvider.notifier).socialLogin(context, LoginPlatform.naver),
            logo: 'assets/images/naver_logo.svg',
            backgroundColor: naver,
            textStyle: white14TextStyle,
            text: '네이버로 계속하기',
          ),
          SizedBox(height: height * 0.015),
          SocialLoginButton(
            onTap: () => ref.read(authProvider.notifier).socialLogin(context, LoginPlatform.google),
            logo: 'assets/images/google_logo.svg',
            backgroundColor: white,
            textStyle: black14TextStyle,
            text: '구글로 계속하기',
            borderColor: Colors.black12,
          ),
        ],
      );
    });
  }
}
