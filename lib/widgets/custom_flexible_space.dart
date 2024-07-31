import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class CustomFlexibleSpace extends StatelessWidget {
  final String title;

  const CustomFlexibleSpace({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        final settings = context
            .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final deltaExtent = settings!.maxExtent - settings.minExtent;
        final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent)
            .clamp(0.0, 1.0);
        final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
        const fadeEnd = 1.0;
        final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: white,
                border: opacity != 1.0
                    ? const Border(
                  bottom: BorderSide(
                    color: dividerGrey,
                    width: 1.0,
                  ),
                )
                    : null,
              ),
              child: Center(
                child: Opacity(
                  opacity: 1 - opacity,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: black24BoldTextStyle,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: opacity,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: black24BoldTextStyle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}