import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mapBottomSheetProvider = StateNotifierProvider<MapBottomSheetNotifier, PageController>((ref) {
  return MapBottomSheetNotifier();
});

class MapBottomSheetNotifier extends StateNotifier<PageController> {
  MapBottomSheetNotifier() : super(PageController(viewportFraction: 0.9));

  void resetPageController() {
    state.jumpToPage(0);
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}