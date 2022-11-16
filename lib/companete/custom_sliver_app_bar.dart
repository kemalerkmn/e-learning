// ignore_for_file: must_be_immutable

import 'package:e_leaning2/colors/colors.dart';
import 'package:e_leaning2/image_and_icon_path/icon_path.dart';
import 'package:e_leaning2/radius_and_padding_utility/radius_utility.dart';
import 'package:flutter/material.dart';

class CustomSliverAppbar extends StatelessWidget {
  CustomSliverAppbar(this.image, this.title, {super.key});
  String? image;
  String? title;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String errorUlr =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQajGlb9oEvpyOlRTbeNmzvAWPa1NOSjwdLAw&usqp=CAU";
    return SliverAppBar(
      floating: false,
      pinned: true,
      leading: IconButton(
        icon: SVGIcon.backArrow.value(),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title ?? "Not found tittle",
        style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 24),
      ),
      flexibleSpace: FlexibleSpaceBar(
          background: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 150,
            child: Image.network(
              image ?? errorUlr,
              fit: BoxFit.cover,
            ),
          )
        ],
      )),
      expandedHeight: 280,
      backgroundColor: ColorsSelection.secondary.value(),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: RadiusUtility.appBarRaidus,
              bottomLeft: RadiusUtility.appBarRaidus)),
    );
  }
}
