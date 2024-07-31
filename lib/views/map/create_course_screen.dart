import 'package:cose_front/utils/app_colors.dart';
import 'package:cose_front/views/map/widget/course_form.dart';
import 'package:cose_front/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/course/course_creation_provider.dart';
import '../../utils/app_text_style.dart';
import '../../widgets/custom_appbar.dart';

class CreateCourseScreen extends ConsumerWidget {
  const CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final places = ref.watch(courseCreationProvider);
    final allSelected = places.isNotEmpty && places.every((place) => place.isSelected);

    return Scaffold(
      appBar: CustomAppBar(
          title: '코스 생성',
          onLeadingPressed: () {
            ref.read(courseCreationProvider.notifier).toggleAllPlacesSelection(false);
            Navigator.of(context).pop();
          }),
      body: places.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: allSelected,
                            checkColor: primary,
                            fillColor: WidgetStateProperty.all<Color>(white),
                            side: const BorderSide(
                              color: primary,
                              width: 1.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onChanged: (bool? value) {
                              ref.read(courseCreationProvider.notifier).toggleAllPlacesSelection(value ?? false);
                            },
                          ),
                          Text(
                            '${places.length}',
                            style: black14TextStyle,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(courseCreationProvider.notifier).deleteSelectedPlaces();
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(createCourseDeleteButtonGrey),
                          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0)),
                          minimumSize: WidgetStateProperty.all<Size>(const Size(0, 0)),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text('삭제', style: black14TextStyle),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ReorderableListView(
                    onReorder: (oldIndex, newIndex) {
                      ref.read(courseCreationProvider.notifier).reorderPlaces(oldIndex, newIndex);
                    },
                    children: List.generate(places.length, (index) {
                      return Padding(
                        key: ValueKey(places[index].place.id),
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Row(
                          children: [
                            Checkbox(
                              key: ValueKey('checkbox_${places[index].place.id}'),
                              value: places[index].isSelected,
                              checkColor: primary,
                              fillColor: WidgetStateProperty.all<Color>(white),
                              side: const BorderSide(
                                color: primary,
                                width: 1.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onChanged: (bool? value) {
                                ref.read(courseCreationProvider.notifier).togglePlaceSelection(places[index].place.id);
                              },
                            ),
                            Expanded(
                              child: Container(
                                key: ValueKey('container_${places[index].place.id}'),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: primary,
                                    width: 1.0, // 외곽선 두께 설정
                                  ),
                                ),
                                child: ListTile(
                                  key: ValueKey('listtile_${places[index].place.id}'),
                                  title: Text(
                                    places[index].place.name,
                                    style: black16TextStyle,
                                  ),
                                  subtitle: Text(
                                    places[index].place.address,
                                    style: sub1Grey14TextStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            )
          : const Center(
              child: Text(
                "아직 장소가 없습니다.",
                style: grey16TextStyle,
              ),
            ),
      bottomNavigationBar: places.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                color: white,
              ),
              padding: EdgeInsets.fromLTRB(
                  width * 0.06, height * 0.01, width * 0.06, height * 0.05),
              child: CustomButton(
                text: '생성',
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return const CourseForm();
                  },
                ),
              ),
            )
          : null,
    );
  }
}
