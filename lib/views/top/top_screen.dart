import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cose_front/views/course/course_screen.dart';
import 'package:cose_front/views/map/map_screen.dart';
import 'package:cose_front/views/notification/notification_screen.dart';
import 'package:cose_front/views/profile/profile_screen.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class TopScreen extends ConsumerWidget {
  const TopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final width = MediaQuery.of(context).size.width;

    final List<Widget> pages = [
      const MapScreen(),
      const CourseScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItemColor: true,
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(selectedIndexProvider.notifier).state = index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: width * 0.08),
            label: '지도',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_mosaic, size: width * 0.08),
            label: '코스',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: width * 0.08),
            label: '알림',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: width * 0.08),
            label: '계정',
          ),
        ],
      ),
    );
  }
}