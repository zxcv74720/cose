import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/course_response_dto.dart';
import '../../views/course/section/course_info.dart';
import '../../views/course/section/member_info.dart';
import '../../widgets/custom_bottom_sheet.dart';

final courseTabIndexProvider = StateNotifierProvider<CourseTabIndexNotifier, int>(
      (ref) => CourseTabIndexNotifier(),
);

class CourseTabIndexNotifier extends StateNotifier<int> {
  CourseTabIndexNotifier() : super(0);

  void onItemTapped(BuildContext context, int index, CourseResponseDto course) {
    state = index;

    switch (index) {
      case 0:
        CustomBottomSheet.show(
          context: context,
          child: CourseInfo(course: course),
        );
        break;
      case 1:
        CustomBottomSheet.show(
          context: context,
          child: MemberInfo(course: course),
        );
        break;
    }
  }
}