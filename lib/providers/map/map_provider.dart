import 'dart:ui';

import 'package:cose_front/services/map_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import '../../dto/place_preview_dto.dart';

final mapProvider = StateNotifierProvider<MapNotifier, MapState>(
    (ref) => MapNotifier(),
);

class MapState {
  final NaverMapController? mapController;
  final bool isBottomSheetVisible;
  final List<PlacePreviewDto>? places;

  MapState({
    this.mapController,
    this.isBottomSheetVisible = false,
    this.places,
  });

  MapState copyWith({
    NaverMapController? mapController,
    bool? isBottomSheetVisible,
    List<PlacePreviewDto>? places,
  }) {
    return MapState(
      mapController: mapController ?? this.mapController,
      isBottomSheetVisible: isBottomSheetVisible ?? this.isBottomSheetVisible,
      places: places ?? this.places,
    );
  }
}

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier() : super(MapState());
  final MapService mapService = MapService();

  void setMapController(NaverMapController controller) {
    state = state.copyWith(mapController: controller);
  }

  void hideBottomSheet() {
    state = state.copyWith(isBottomSheetVisible: false);
  }

  void dismissPlaceInformation() {
    state = state.copyWith(isBottomSheetVisible: false);
    state.mapController!.clearOverlays();
  }

  void onSymbolTapped(NSymbolInfo symbol) async {
    String address = await mapService.getPlaceAddress(symbol.position);

    final places = await mapService.getPlacesInfo(address);

    state = state.copyWith(places: places);

    if (places.isNotEmpty) {
      final marker = NMarker(
        id: DateTime.now().toString(),
        position: symbol.position,
        anchor: const NPoint(0.5, 0.5),
        size: const Size(50, 50),
        icon: const NOverlayImage.fromAssetImage('assets/marker/marker.png'),
      );

      state = state.copyWith(isBottomSheetVisible: true);
      state.mapController!.clearOverlays();
      state.mapController!.addOverlay(marker);
    } else {
      state = state.copyWith(isBottomSheetVisible: false);
      state.mapController!.clearOverlays();
    }
  }

  Future<NLatLng> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    return NLatLng(position.latitude, position.longitude);
  }
}
