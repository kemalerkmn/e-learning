import 'package:flutter/material.dart';

import '../radius_and_padding_utility/padding_utiliy.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.colors,
    required this.press,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final Color colors;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Container(
              margin: PaddingUtiliy.horizontalPadding,
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  color: colors,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: icon),
        ],
      ),
    );
  }
}
