import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/account/reset_password_provider.dart';
import '../../../utils/validations.dart';
import '../../../widgets/custom_buttom.dart';
import '../../../widgets/custom_input_field.dart';

class EmailInputWidget extends StatefulWidget {
  final VoidCallback onNext;

  const EmailInputWidget({super.key, required this.onNext});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final ValueNotifier<bool> _isButtonDisabled = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateButtonState);
    _isButtonDisabled.dispose();
    _emailFocus.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    _isButtonDisabled.value = _emailController.text.isEmpty;
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
            label: '이메일',
            controller: _emailController,
            focusNode: _emailFocus,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            hintText: 'example@email.com',
            icon: Icons.mail_outline,
            validator: (value) => validateEmail(_emailFocus, value),
          ),
          SizedBox(height: height * 0.05),
          Consumer(builder: (context, ref, child) {
            return ValueListenableBuilder<bool>(
              valueListenable: _isButtonDisabled,
              builder: (context, isDisabled, child) {
                return CustomButton(
                  text: '전송',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      bool success =  await ref.read(resetPasswordProvider.notifier).sendEmailVerificationCode(context, _emailController.text);
                      if (success) {
                        widget.onNext();
                      }
                    }
                  },
                  isDisabled: isDisabled,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
