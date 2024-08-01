import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dto/place_preview_dto.dart';
import '../../../model/place.dart';
import '../../../providers/course/course_creation_provider.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/launch_url.dart';

final PageController _pageController = PageController(viewportFraction: 0.9);

class PlaceCard extends ConsumerWidget {
  final List<PlacePreviewDto> places;
  late double height;
  late double width;

  PlaceCard({
    super.key,
    required this.places,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: height * 0.02,
      left: 0,
      right: 0,
      child: SizedBox(
        height: height * 0.17,
        child: PageView.builder(
          controller: _pageController,
          itemCount: places.length,
          itemBuilder: (context, index) {
            return _buildPlaceCard(places[index]);
          },
        ),
      ),
    );
  }

  Widget _buildPlaceCard(PlacePreviewDto place) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.015, vertical: height * 0.01),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.3),
              blurRadius: 4.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: place.name!,
                          style: black16TextStyle,
                        ),
                        if (place.category != null && place.category!.isNotEmpty)
                          TextSpan(
                            text: ' ${place.category!}',
                            style: sub2Grey13TextStyle,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.005),
                  Text(
                    place.address!,
                    style: sub1Grey14TextStyle,
                  ),
                  SizedBox(height: height * 0.01),
                  GestureDetector(
                    onTap: () => launchURL(place.url!),
                    child: Text(
                      '더보기',
                      style: blue13TextStyle.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: blue,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: width * 0.03),
            _buildAddButton(place),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(PlacePreviewDto place) {
    return Consumer(
      builder: (context, ref, _) {
        return GestureDetector(
          onTap: () {
            final newPlace = Place(
              id: DateTime.now().millisecondsSinceEpoch,
              address: place.address!,
              name: place.name!,
              url: place.url!,
              category: place.category!,
              longitude: place.longitude,
              latitude: place.latitude,
              placeOrder: ref.read(courseCreationProvider).length,
            );
            ref.read(courseCreationProvider.notifier).addPlace(newPlace);
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add_location_alt_outlined,
              color: white,
            ),
          ),
        );
      },
    );
  }
}
