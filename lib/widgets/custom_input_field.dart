import 'package:cose_front/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_text_style.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String hintText;
  final IconData icon;
  final String? Function(String?) validator;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    required this.textInputAction,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: black14TextStyle,
        ),
        SizedBox(height: height * 0.001),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintGrey14TextStyle,
            filled: true,
            fillColor: inputFieldGrey,
            prefixIcon: Icon(icon, color: inputPointGrey),
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
          ),
          validator: validator,
        ),
      ],
    );
  }
}
