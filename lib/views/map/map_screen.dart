import 'package:cose_front/providers/map/map_provider.dart';
import 'package:cose_front/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../providers/course/course_creation_provider.dart';
import 'widget/place_card.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  late Future<NLatLng> _targetFuture;

  @override
  void initState() {
    super.initState();
    _targetFuture = ref.read(mapProvider.notifier).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final map = ref.watch(mapProvider);

    return FutureBuilder<NLatLng>(
      future: _targetFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No location data'));
        }

        final target = snapshot.data!;

        return Stack(
          children: [
            NaverMap(
              options: NaverMapViewOptions(
                mapType: NMapType.basic,
                activeLayerGroups: [NLayerGroup.building, NLayerGroup.transit],
                initialCameraPosition: NCameraPosition(target: target, zoom: 15),
              ),
              onMapReady: (controller) => ref.read(mapProvider.notifier).setMapController(controller),
              onMapTapped: (_, __) => ref.read(mapProvider.notifier).dismissPlaceInformation(),
              onSymbolTapped: ref.read(mapProvider.notifier).onSymbolTapped,
            ),
            if (map.isBottomSheetVisible && map.places != null)
              PlaceCard(
                places: map.places!,
              ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(width * 0.03),
                  child: Column(
                    children: [
                      _buildIconButton(Icons.search, () {
                        ref.read(mapProvider.notifier).dismissPlaceInformation();
                        context.push('/map/search');
                      }),
                      SizedBox(height: height * 0.01),
                      _buildCourseButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        color: primary,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget _buildCourseButton() {
    final placesCount = ref.watch(courseCreationProvider.select((value) => value.length));
    return Badge(
      isLabelVisible: placesCount > 0,
      label: Text(
        '$placesCount',
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      child: _buildIconButton(
        Icons.golf_course,
        () {
          ref.read(mapProvider.notifier).dismissPlaceInformation();
          context.push('/map/create-course');
        },
      ),
    );
  }
}