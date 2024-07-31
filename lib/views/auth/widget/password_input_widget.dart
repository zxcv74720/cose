import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/account/reset_password_provider.dart';
import '../../../utils/validations.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/custom_input_field.dart';

class PasswordInputWidget extends StatefulWidget {
  final VoidCallback onNext;

  const PasswordInputWidget({super.key, required this.onNext});

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final ValueNotifier<bool> _isButtonDisabled = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updateButtonState);
    _confirmPasswordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _passwordController.removeListener(_updateButtonState);
    _confirmPasswordController.removeListener(_updateButtonState);
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    _isButtonDisabled.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    _isButtonDisabled.value = _passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final height = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomInputField(
            label: '비밀번호',
            controller: _passwordController,
            focusNode: _passwordFocus,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            hintText: '특수문자, 대소문자, 숫자 포함 8자 이상',
            icon: Icons.lock_outline,
            validator: (value) => validatePassword(_passwordFocus, value),
            isPassword: true,
          ),

          SizedBox(height: height * 0.02),
          CustomInputField(
            label: '비밀번호 확인',
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocus,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            hintText: '비밀번호를 다시 입력해 주세요',
            icon: Icons.lock_outline,
            validator: (value) => validateConfirmPassword(_confirmPasswordFocus, value, _passwordController.text),
            isPassword: true,
          ),

          SizedBox(height: height * 0.05),
          Consumer(
              builder: (context, ref, child) {
                return ValueListenableBuilder<bool>(
                  valueListenable: _isButtonDisabled,
                  builder: (context, isDisabled, child) {
                    return CustomButton(
                      text: '재설정',
                      onPressed: isDisabled ? null : () async {
                        if (formKey.currentState!.validate()) {
                          bool success = await ref.read(resetPasswordProvider.notifier).resetPassword(context, _passwordController.text);
                          if (success) {
                            widget.onNext();
                          }
                        }
                      },
                      isDisabled: isDisabled,
                    );
                  },
                );
              }
          ),
        ],
      ),
    );
  }
}