import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:path_provider/path_provider.dart';
import '../../dto/place_response_dto.dart';
import '../../services/course_service.dart';
import '../../views/course/section/place_info.dart';
import '../../widgets/custom_bottom_sheet.dart';

final courseMapProvider = StateNotifierProvider<CourseMapNotifier, NaverMapController?>(
      (ref) => CourseMapNotifier(),
);

class CourseMapNotifier extends StateNotifier<NaverMapController?> {
  CourseMapNotifier() : super(null);

  final CourseService _courseService = CourseService();

  void setMapController(NaverMapController controller) {
    state = controller;
  }

  void createMarkers(BuildContext context, List<PlaceResponseDto> places) async {
    Set<NMarker> markers = {};

    for (var place in places) {
      final marker = NMarker(
        id: place.placeOrder.toString(),
        position: NLatLng(place.latitude, place.longitude),
        caption: NOverlayCaption(text: place.name),
        anchor: const NPoint(0.5, 0.5),
        size: const Size(44, 44),
        icon: NOverlayImage.fromAssetImage('assets/marker/marker_${place.placeOrder}.png'),
      );

      marker.setOnTapListener((NMarker marker) {
        CustomBottomSheet.show(
          context: context,
          child: PlaceInfo(placeId: place.id),
        );
      });

      markers.add(marker);
    }

    state!.addOverlayAll(markers);
  }

  Future<void> updateCoursePreview(int courseId) async {
    final previewImagePath = await captureMapImage(courseId);
    if (previewImagePath.isNotEmpty) {
      await _courseService.updatePreviewImagePath(courseId, previewImagePath);
    }
  }

  Future<String> captureMapImage(int courseId) async {
    try {
      File imageFile = await state!.takeSnapshot(
          showControls: false,
          compressQuality: 95
      );
      final directory = await getApplicationDocumentsDirectory();
      final previewImagePath = '${directory.path}/course_$courseId.png';
      await imageFile.copy(previewImagePath);
      return previewImagePath;
    } catch (e, stackTrace) {
      stderr.writeln('오류 발생: ${e.runtimeType} - ${e.toString()}');
      stderr.writeln('스택 트레이스:');
      stderr.writeln(stackTrace.toString());
      rethrow;
    }
  }
}