import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/course/course_providers.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_text_style.dart';
import '../../widgets/custom_flexible_space.dart';
import 'widget/custom_list_item.dart';

class CourseScreen extends ConsumerWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses = ref.watch(previewCoursesProvider);
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: white,
              expandedHeight: height * 0.08,
              floating: true,
              pinned: true,
              flexibleSpace: const CustomFlexibleSpace(title: '코스'),
            ),
            courses.when(
              data: (data) {
                if (data.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "표시할 코스가 없습니다.",
                        style: grey16TextStyle,
                      ),
                    ),
                  );
                } else {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        final course = data[index];
                        return CustomListItem(
                          key: ValueKey(course.id),
                          id: course.id,
                          title: course.title,
                          previewImagePath: course.previewImagePath,
                          lastUpdated: course.lastUpdated,
                        );
                      },
                      childCount: data.length,
                    ),
                  );
                }
              },
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, stackTrace) => SliverFillRemaining(
                child: Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}