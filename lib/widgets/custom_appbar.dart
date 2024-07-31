import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.backgroundColor,
    this.foregroundColor,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: black18BoldTextStyle,
      ),
      actions: actions,
      leading: showBackButton
          ? IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: black,
        ),
        onPressed: onLeadingPressed ?? () => Navigator.of(context).pop(),
      )
          : null,
      automaticallyImplyLeading: showBackButton,
      backgroundColor: backgroundColor ?? white,
      foregroundColor: foregroundColor ?? primary,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: dividerGrey,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1.0); // 구분선 높이를 포함
}