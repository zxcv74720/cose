import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.selectedItemColor,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  final bool selectedItemColor;
  final int currentIndex;
  final void Function(int) onTap;
  final List<BottomNavigationBarItem> items;


  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(height: 1, color: dividerGrey),
      BottomNavigationBar(
        selectedItemColor: selectedItemColor ? primary : disableBottomNavGrey,
        unselectedItemColor: disableBottomNavGrey,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: onTap,
        items: items,
      ),
    ],
    );
  }
}
