// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_leaning2/companete/price_tag.dart';
import 'package:e_leaning2/screens/course_learning_screen/course_learning_screen.dart';
import 'package:flutter/material.dart';

import 'package:e_leaning2/radius_and_padding_utility/radius_utility.dart';

import '../../../colors/colors.dart';
import '../../../course/course.dart';
import '../../../image_and_icon_path/image_path.dart';
import '../../course_details_screen/course_details_screen.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
    required this.isHas,
  }) : super(key: key);

  final Course course;
  final bool isHas;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isHas) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseLearningScreen(
                        course: course,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseDetailsScreen(
                        course: course,
                      )));
        }
      },
      child: Container(
        width: 355,
        height: 82,
        decoration: BoxDecoration(
          border:
              Border.all(width: 3, color: ColorsSelection.borderColor.value()),
          color: Colors.white,
          borderRadius: RadiusUtility.defaultRaidus,
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              color: Color.fromRGBO(242, 242, 242, 1),
              spreadRadius: 3,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: RadiusUtility.defaultRaidus,
                ),
                child: Image.network(
                  course.image.toString(),
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course.courseTitle.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    course.durationText.toString(),
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
              isHas
                  ? Text(
                      "% ${course.completion}",
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )
                  : PriceTag(price: course.price.toString()),
              isHas
                  ? GlobalImage.PlayImage.image()
                  : GlobalImage.PlayImageFalse.image()
            ],
          ),
        ),
      ),
    );
  }
}
