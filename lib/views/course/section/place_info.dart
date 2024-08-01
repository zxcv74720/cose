import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/course/course_providers.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/launch_url.dart';

class PlaceInfo extends ConsumerStatefulWidget {
  const PlaceInfo({super.key, required this.placeId});

  final int placeId;

  @override
  _PlaceInfoWidgetState createState() => _PlaceInfoWidgetState();
}

class _PlaceInfoWidgetState extends ConsumerState<PlaceInfo> {
  bool isEditing = false;
  final TextEditingController _contentController = TextEditingController();

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final course = ref.watch(courseProvider);
    final place = course.value!.places.firstWhere((p) => p.id == widget.placeId);

    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height * 0.02, left: width * 0.03, right: width * 0.03, bottom: height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    place.name,
                    style: black16TextStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: width * 0.012),
                  if (place.category != null && place.category.isNotEmpty)
                    Text(
                      place.category,
                      style: sub2Grey13TextStyle,
                    ),
                ],
              ),
              SizedBox(height: height * 0.001),
              Row(
                children: [
                  Text(
                    place.address,
                    style: sub1Grey14TextStyle,
                  ),
                  SizedBox(width: width * 0.01),
                  GestureDetector(
                    onTap: () => launchURL(place.url!),
                    child: const Icon(
                      Icons.link,
                      color: blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: isEditing ? _buildEditMemo(height) : _buildReadMemo(height, place.content),
        ),
      ],
    );
  }

  Widget _buildReadMemo(double height, String content) {
    return Container(
      height: height * 0.3,
      decoration: BoxDecoration(
        color: postit,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: content.isEmpty
                  ? Text(
                '메모를 작성해 보세요!',
                style: memoBlack16TextStyle,
              )
                  : Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  isEditing = true;
                  _contentController.text = content;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditMemo(double height) {
    return Container(
      height: height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _contentController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: '메모를 작성해 보세요!',
                  hintStyle: memoBlack16TextStyle,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: () async {
                ref.read(courseProvider.notifier).updatePlaceContent(widget.placeId, _contentController.text);
                setState(() {
                  isEditing = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}