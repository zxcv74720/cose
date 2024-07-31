import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../utils/app_colors.dart';

void customToast(BuildContext context, String msg) {
  showToast(
    msg,
    context: context,
    backgroundColor: inputFieldGrey,
    textStyle: const TextStyle(
      color: primary,
    ),
    borderRadius: BorderRadius.circular(100),
    animation: StyledToastAnimation.slideFromBottom,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: const Duration(seconds: 1),
    duration: const Duration(seconds: 2),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}
