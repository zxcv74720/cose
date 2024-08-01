import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/validations.dart';
import '../../../widgets/custom_input_field.dart';
import '../../providers/account/auth_provider.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  final ValueNotifier<bool> _isButtonDisabled = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateButtonState);
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _isButtonDisabled.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    _isButtonDisabled.value = _nameController.text.isEmpty || _emailController.text.isEmpty || _passwordController.text.isEmpty;
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
          title: '회원가입',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.02),
                  CustomInputField(
                    label: '별명',
                    controller: _nameController,
                    focusNode: _nameFocus,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    hintText: '2자 이상 15자 이내로 입력',
                    icon: Icons.person_outline,
                    validator: (value) => validateName(_nameFocus, value),
                  ),
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
                    validator: (value) =>
                        validatePassword(_passwordFocus, value),
                    isPassword: true,
                  ),
                  SizedBox(height: height * 0.05),
                  Consumer(builder: (context, ref, child) {
                    return ValueListenableBuilder<bool>(
                      valueListenable: _isButtonDisabled,
                      builder: (context, isDisabled, child) {
                        return CustomButton(
                          text: '회원가입',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              ref.read(authProvider.notifier).signUp(context, _emailController.text, _passwordController.text, _nameController.text);
                              context.go('/login');
                            }
                          },
                          isDisabled: isDisabled,
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
