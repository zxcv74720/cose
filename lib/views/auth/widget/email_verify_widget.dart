import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/account/reset_password_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../widgets/custom_buttom.dart';

class EmailVerifyWidget extends StatefulWidget {
  final VoidCallback onNext;

  const EmailVerifyWidget({super.key, required this.onNext});

  @override
  State<EmailVerifyWidget> createState() => _EmailVerifyWidgetState();
}

class _EmailVerifyWidgetState extends State<EmailVerifyWidget> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final ValueNotifier<bool> _isButtonDisabled = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    for (var controller in _controllers) {
      controller.addListener(_updateButtonState);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.removeListener(_updateButtonState);
      controller.dispose();
    }
    _isButtonDisabled.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    _isButtonDisabled.value = _controllers.any((controller) => controller.text.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4, (index) => SizedBox(
                  width: width * 0.17,
                  child: TextFormField(
                        controller: _controllers[index],
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: inputFieldGrey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: inputPointGrey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: inputPointGrey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: primary),
                          ),
                        )
                    ),
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
                      text: '인증',
                      onPressed: isDisabled ? null : () async {
                        String code = _controllers.map((controller) => controller.text).join();
                        if (code.length == 4) {
                          bool success = await ref.read(resetPasswordProvider.notifier).checkEmailVerificationCode(context, code);
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