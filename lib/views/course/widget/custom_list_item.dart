import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/course/course_providers.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../course_detail_screen.dart';

class CustomListItem extends ConsumerWidget {
  const CustomListItem({
    super.key,
    required this.id,
    required this.title,
    required this.previewImagePath,
    required this.lastUpdated,
  });

  final int id;
  final String title;
  final String previewImagePath;
  final String lastUpdated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        ref.read(courseIdProvider.notifier).state = id;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: dividerGrey,
                  width: 1,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.file(
                  File(previewImagePath),
                  height: height * 0.08,
                  width: width * 0.25,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: height * 0.08,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                        color: grey3,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Icon(Icons.photo_library_outlined, color: white),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: black16TextStyle,
                    ),
                    Text(
                      lastUpdated,
                      style: sub2Grey14TextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}