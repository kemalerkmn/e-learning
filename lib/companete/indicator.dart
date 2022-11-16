import 'package:e_leaning2/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../image_and_icon_path/image_path.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(),
        GlobalImage.MainIcon.image(),
        const SizedBox(height: 16),
        Text("Udamely", style: Theme.of(context).textTheme.headline2),
        const Spacer(),
        LoadingAnimationWidget.fourRotatingDots(
          size: 60,
          color: ColorsSelection.primary.value(),
        ),
        const Spacer(),
      ]),
    );
  }
}
