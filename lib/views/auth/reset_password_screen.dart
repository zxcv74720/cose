import 'package:cose_front/views/auth/widget/email_input_widget.dart';
import 'package:cose_front/views/auth/widget/email_verify_widget.dart';
import 'package:cose_front/views/auth/widget/password_input_widget.dart';
import 'package:cose_front/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final PageController _pageController = PageController();

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: '비밀번호 재설정',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              EmailInputPage(
                onNext: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
              EmailVerifyPage(
                onNext: () => _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
              PasswordInputPage(
                onNext: () => context.pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailInputPage extends StatelessWidget {
  final VoidCallback onNext;
  const EmailInputPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return EmailInputWidget(onNext: onNext);
  }
}

class EmailVerifyPage extends StatelessWidget {
  final VoidCallback onNext;
  const EmailVerifyPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return EmailVerifyWidget(onNext: onNext);
  }
}

class PasswordInputPage extends StatelessWidget {
  final VoidCallback onNext;
  const PasswordInputPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return PasswordInputWidget(onNext: onNext);
  }
}
