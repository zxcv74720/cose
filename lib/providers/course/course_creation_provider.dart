import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../mapper/course_mapper.dart';
import '../../model/place.dart';
import '../../utils/database_helper.dart';
import '../../services/map_service.dart';
import '../../services/course_service.dart';

final courseCreationProvider = StateNotifierProvider<CourseCreationNotifier, List<PlaceSelectionStatus>>((ref) {
  return CourseCreationNotifier(MapService(), CourseService(), LocalDatabaseHelper.instance);
});

class CourseCreationNotifier extends StateNotifier<List<PlaceSelectionStatus>> {
  final MapService _mapService;
  final CourseService _courseService;
  final LocalDatabaseHelper _databaseHelper;

  CourseCreationNotifier(this._mapService, this._courseService, this._databaseHelper) : super([]) {
    _loadAllPlaces();
  }

  Future<void> _loadAllPlaces() async {
    final places = await _databaseHelper.fetchPlaces();
    state = places.map((place) => PlaceSelectionStatus(place: place)).toList();
  }

  Future<void> addPlace(Place place) async {
    await _databaseHelper.insertPlace(place);
    await _loadAllPlaces();
  }

  Future<void> deletePlace(int id) async {
    await _databaseHelper.deletePlace(id);
    await _loadAllPlaces();
  }

  Future<void> deleteSelectedPlaces() async {
    final selectedPlaces = state.where((place) => place.isSelected).toList();
    for (final status in selectedPlaces) {
      await _databaseHelper.deletePlace(status.place.id);
    }
    await _loadAllPlaces();
  }

  void togglePlaceSelection(int id) {
    state = [
      for (final status in state)
        if (status.place.id == id)
          status.copyWith(isSelected: !status.isSelected)
        else
          status,
    ];
  }

  void toggleAllPlacesSelection(bool isSelected) {
    state = [
      for (final status in state)
        status.copyWith(isSelected: isSelected),
    ];
  }

  Future<void> reorderPlaces(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final List<PlaceSelectionStatus> updatedPlaces = List.from(state);
    final PlaceSelectionStatus movedPlace = updatedPlaces.removeAt(oldIndex);
    updatedPlaces.insert(newIndex, movedPlace);

    for (int i = 0; i < updatedPlaces.length; i++) {
      await _databaseHelper.updatePlaceIndex(updatedPlaces[i].place.id, i);
    }

    state = updatedPlaces;
  }

  Future<void> createCourse(String title) async {
    final places = state.map((status) => placeToPlaceResponseDto(status.place)).toList();
    final markers = places.map((place) =>
        NMarker(
            id: 'marker_${place.id}',
            position: NLatLng(place.latitude, place.longitude)
        )
    ).toSet();

    final bounds = _calculateBounds(markers);
    final cameraPosition = _calculateCameraPosition(bounds);

    await _courseService.createCourse(title, places, cameraPosition.longitude, cameraPosition.latitude);
    await _databaseHelper.deleteAllPlaces();
    await _loadAllPlaces();
  }

  NLatLngBounds _calculateBounds(Set<NMarker> markers) {
    const padding = 0.005;
    var minLat = double.infinity;
    var maxLat = -double.infinity;
    var minLng = double.infinity;
    var maxLng = -double.infinity;

    for (var marker in markers) {
      minLat = marker.position.latitude < minLat ? marker.position.latitude : minLat;
      maxLat = marker.position.latitude > maxLat ? marker.position.latitude : maxLat;
      minLng = marker.position.longitude < minLng ? marker.position.longitude : minLng;
      maxLng = marker.position.longitude > maxLng ? marker.position.longitude : maxLng;
    }

    return NLatLngBounds(
      southWest: NLatLng(minLat - padding, minLng - padding),
      northEast: NLatLng(maxLat + padding, maxLng + padding),
    );
  }

  NLatLng _calculateCameraPosition(NLatLngBounds bounds) {
    return NLatLng(
      (bounds.northEast.latitude + bounds.southWest.latitude) / 2,
      (bounds.northEast.longitude + bounds.southWest.longitude) / 2,
    );
  }
}

class PlaceSelectionStatus {
  final bool isSelected;
  final Place place;

  PlaceSelectionStatus({
    this.isSelected = false,
    required this.place,
  });

  PlaceSelectionStatus copyWith({bool? isSelected}) {
    return PlaceSelectionStatus(
      isSelected: isSelected ?? this.isSelected,
      place: place,
    );
  }
}