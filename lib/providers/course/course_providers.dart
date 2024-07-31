import 'package:cose_front/services/course_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dto/course_preview_dto.dart';
import '../../dto/course_response_dto.dart';

final courseService = CourseService();

final previewCoursesProvider = FutureProvider.autoDispose<List<CoursePreviewDto>>((ref) => courseService.getCourses());

final courseIdProvider = StateProvider<int?>((ref) => null);

final courseProvider = StateNotifierProvider.autoDispose<CourseNotifier, AsyncValue<CourseResponseDto?>>((ref) => CourseNotifier(ref));

class CourseNotifier extends StateNotifier<AsyncValue<CourseResponseDto?>> {
  final Ref _ref;

  CourseNotifier(this._ref) : super(const AsyncValue.loading()) {
    _fetchCourse();
  }

  Future<void> _fetchCourse() async {
    final courseId = _ref.read(courseIdProvider);
    if (courseId == null) {
      state = const AsyncValue.data(null);
      return;
    }

    state = const AsyncValue.loading();
    try {
      final course = await courseService.getCourseById(courseId);
      state = AsyncValue.data(course);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updatePlaceContent(int placeId, String newContent) async {
    state.whenData((course) async {
      if (course == null) return;

      final updatedPlaces = course.places.map((place) {
        if (place.id == placeId) {
          return place.copyWith(content: newContent);
        }
        return place;
      }).toList();

      final updatedCourse = course.copyWith(places: updatedPlaces);
      state = AsyncValue.data(updatedCourse);

      try {
        await courseService.updatePlaceContent(placeId, newContent);
      } catch (error) {
        state = AsyncValue.data(course);
      }
    });
  }

  void refreshCourse() {
    _fetchCourse();
  }
}