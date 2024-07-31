import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final String logo;
  final Color backgroundColor;
  final TextStyle textStyle;
  final String text;
  final Color? borderColor;

  const SocialLoginButton({
    super.key,
    required this.onTap,
    required this.logo,
    required this.backgroundColor,
    required this.textStyle,
    required this.text,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor,
          border: borderColor != null ? Border.all(color: borderColor!, width: 1) : null,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.045),
                child: SvgPicture.asset(
                  logo,
                  width: width * 0.045,
                  height: width * 0.045,
                ),
              ),
            ),
            Center(
              child: Text(text, style: textStyle),
            ),
          ],
        ),
      ),
    );
  }
}