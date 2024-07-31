import 'package:cose_front/providers/account/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/validations.dart';
import '../../../widgets/custom_input_field.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttom.dart';

class LocalLoginScreen extends StatefulWidget {
  const LocalLoginScreen({super.key});

  @override
  State<LocalLoginScreen> createState()  => _LocalLoginScreenState();
}

class _LocalLoginScreenState extends State<LocalLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final ValueNotifier<bool> _isButtonDisabled = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _isButtonDisabled.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    _isButtonDisabled.value = _emailController.text.isEmpty || _passwordController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: '로그인',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * 0.02),
                  CustomInputField(
                    label: '이메일',
                    controller: _emailController,
                    focusNode: _emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: 'example@email.com',
                    icon: Icons.mail_outline,
                    validator: (value) => validateEmail(_emailFocus, value),
                  ),

                  SizedBox(height: height * 0.02),
                  CustomInputField(
                    label: '비밀번호',
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hintText: '특수문자, 대소문자, 숫자 포함 8자 이상',
                    icon: Icons.lock_outline,
                    validator: (value) => validatePassword(_passwordFocus, value),
                    isPassword: true,
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/login/local/reset-password'),
                      child: const Text(
                        '비밀번호를 잊으셨나요?',
                        style: blue14TextStyle,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.05),
                  Consumer(
                    builder: (context, ref, child) {
                      return ValueListenableBuilder<bool>(
                        valueListenable: _isButtonDisabled,
                        builder: (context, isDisabled, child) {
                          return CustomButton(
                            text: '로그인',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                ref.read(authProvider.notifier).localLogin(context, _emailController.text, _passwordController.text);
                              }
                            },
                            isDisabled: isDisabled,
                          );
                        }
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}