import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MapIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const MapIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.3),
              blurRadius: 4.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: primary),
        ),
      ),
    );
  }
}