import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../radius_and_padding_utility/radius_utility.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.press,
    required this.tittle,
  }) : super(key: key);

  final VoidCallback press;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56,
        width: 327,
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsSelection.primary.value(),
              shape: RoundedRectangleBorder(
                  borderRadius: RadiusUtility.defaultRaidus)),
          child: Text(tittle, style: Theme.of(context).textTheme.headline6),
        ));
  }
}
