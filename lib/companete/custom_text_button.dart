import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ));
  }
}
