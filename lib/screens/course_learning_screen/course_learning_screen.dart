import 'package:e_leaning2/colors/colors.dart';
import 'package:e_leaning2/companete/custom_button.dart';
import 'package:e_leaning2/companete/custom_sliver_app_bar.dart';
import 'package:e_leaning2/image_and_icon_path/icon_path.dart';
import 'package:e_leaning2/image_and_icon_path/image_path.dart';
import 'package:e_leaning2/radius_and_padding_utility/padding_utiliy.dart';
import 'package:flutter/material.dart';

import '../../course/course.dart';
import '../../radius_and_padding_utility/radius_utility.dart';

class CourseLearningScreen extends StatefulWidget {
  const CourseLearningScreen({super.key, required this.course});
  final Course course;

  @override
  State<CourseLearningScreen> createState() => _CourseLearningScreenState();
}

class _CourseLearningScreenState extends State<CourseLearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: CustomButton(
            press: () {
              // print(widget.course.lessons![0].fromMap(Map<String,dy));
            },
            tittle: "Resume last lesson"),
      ),
      body: CustomScrollView(
        slivers: [
          CustomSliverAppbar(widget.course.image.toString(),
              widget.course.courseTitle.toString()),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              // ignore: prefer_const_literals_to_create_immutables
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                const TeacherCard(),
                const SizedBox(
                  height: 16,
                ),
                const LessonCard(),
                const SizedIcon(),
                const LessonCard(),
                const SizedIcon(),
                const LessonCard(),
                const SizedIcon(),
                const LessonCard(),
              ]),
            )
          ]))
        ],
      ),
    );
  }
}

class SizedIcon extends StatelessWidget {
  const SizedIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
          height: 38, width: 24, child: Center(child: SVGIcon.sized.value())),
    );
  }
}

class LessonCard extends StatelessWidget {
  const LessonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 24,
              width: 24,
              color: ColorsSelection.secondary.value(),
              child: Center(
                  child: Text("1",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(color: Colors.black))),
            ),
            Column(
              children: [
                Text(
                  "Introduction to figma",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "Duration: 20 minutes",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(fontSize: 10),
                ),
              ],
            ),
            GlobalImage.PlayImageFalse.image()
          ],
        ),
      ],
    );
  }
}

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 82,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: RadiusUtility.defaultRaidus,
        // ignore: prefer_const_literals_to_create_immutables
        border:
            Border.all(width: 3, color: ColorsSelection.borderColor.value()),
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
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/img/img_profile.png"),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kemal Erkmen",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Teacher: UI/UX Designer",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
