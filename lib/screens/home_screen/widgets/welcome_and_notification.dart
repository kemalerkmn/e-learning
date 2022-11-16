import 'package:flutter/material.dart';

import '../../../image_and_icon_path/icon_path.dart';

class WelcomeAndNotification extends StatelessWidget {
  const WelcomeAndNotification({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello 👋 ",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(title, style: Theme.of(context).textTheme.headline4)
          ],
        ),
        SVGIcon.notification.value(),
      ],
    );
  }
}
