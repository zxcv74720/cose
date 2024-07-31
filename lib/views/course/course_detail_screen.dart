import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../../providers/course/course_map_provider.dart';
import '../../providers/course/course_providers.dart';
import '../../providers/course/course_tab_index_provider.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';

class CourseDetailScreen extends ConsumerWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final course = ref.watch(courseProvider);

    return course.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      data: (course) => Scaffold(
        appBar: const CustomAppBar(title: ''),
        body: SafeArea(
          child: NaverMap(
            options: NaverMapViewOptions(
              mapType: NMapType.basic,
              activeLayerGroups: [NLayerGroup.building, NLayerGroup.transit],
              initialCameraPosition: NCameraPosition(
                target: NLatLng(course!.cameraLatitude, course.cameraLongitude),
                zoom: 13,
              ),
            ),
            onMapReady: (controller) async {
              ref.read(courseMapProvider.notifier).setMapController(controller);
              ref.read(courseMapProvider.notifier).createMarkers(context, course.places);
              await Future.delayed(const Duration(milliseconds: 1000)); // 빌드된 지도 화면을 캡쳐하는 거라 딜레이를 줬음
              ref.read(courseMapProvider.notifier).updateCoursePreview(course.id);
            },
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          selectedItemColor: false,
          currentIndex: ref.watch(courseTabIndexProvider),
          onTap: (index) => ref.read(courseTabIndexProvider.notifier).onItemTapped(context, index, course),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline, size: width * 0.07),
              label: '코스 정보',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt, size: width * 0.07),
              label: '멤버 관리',
            ),
          ],
        ),
      ),
    );
  }
}