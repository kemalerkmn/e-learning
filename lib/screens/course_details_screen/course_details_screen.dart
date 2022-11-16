// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_leaning2/companete/custom_button.dart';
import 'package:e_leaning2/companete/price_tag.dart';
import 'package:e_leaning2/course/course.dart';
import 'package:e_leaning2/radius_and_padding_utility/padding_utiliy.dart';
import 'package:e_leaning2/service/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../companete/custom_sliver_app_bar.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key, required this.course});
  final Course course;
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  List<dynamic>? user;
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppbar(widget.course.image.toString(),
              widget.course.courseTitle.toString()),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: PaddingUtiliy.horizontalPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      PriceTag(
                        price: widget.course.price.toString(),
                      ),
                    ],
                  ),
                  CourseInfoTexts(
                      "About the course", widget.course.courseInfo.toString()),
                  CourseInfoTexts(
                      "Duration", widget.course.durationText.toString()),
                  CourseInfoTexts("Tutor", widget.course.tutor.toString()),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                      child: CustomButton(
                          press: () {
                            // user = widget.course.users!;
                            widget.course.users!.add(FirebaseAuth
                                .instance.currentUser?.email
                                .toString());
                            // user!.add("ali@gmail.com");

                            var collection =
                                FirebaseFirestore.instance.collection('Course');
                            collection
                                .doc(widget.course
                                    .id) // <-- Doc ID where data should be updated.
                                .update({'users': widget.course.users});
                          },
                          tittle: "Add to card"))
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

class CourseInfoTexts extends StatelessWidget {
  CourseInfoTexts(this.title, this.subtitle, {super.key});

  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title ?? "No Data",
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            subtitle ?? "No Data",
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
