import 'package:cose_front/dto/course_response_dto.dart';
import 'package:cose_front/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/app_colors.dart';

class CourseInfo extends StatelessWidget {
  final CourseResponseDto course;

  const CourseInfo({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(14.0),
              topLeft: Radius.circular(14.0),
              bottomRight: Radius.circular(28.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.03, horizontal: width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course!.title,
                  style: white18TextStyle,
                ),
                Text(
                  '총 ${course!.places.length.toString()}곳',
                  style: white12TextStyle.copyWith(color: white.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.03),
          child: Column(
            children: course!.places.asMap().entries.map((entry) {
              final index = entry.key;
              final place = entry.value;
              return Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  children: [
                    _buildLeadingIcon(index, height, course.places.length),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.name,
                            style: sub1Grey14TextStyle,
                          ),
                          Text(
                            place.address,
                            style: sub2Grey13TextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }


  Widget _buildLeadingIcon(int index, double height, int length) {
    final String assetName;

    if (length == 1) {
      assetName = 'assets/images/load_single.svg';
    } else if (index == 0) {
      assetName = 'assets/images/load_start.svg';
    } else if (index == length - 1) {
      assetName = 'assets/images/load_end.svg';
    } else {
      assetName = 'assets/images/load.svg';
    }

    return SvgPicture.asset(
      assetName,
      height: height * 0.07,
    );
  }
}