import 'package:e_leaning2/colors/colors.dart';
import 'package:e_leaning2/radius_and_padding_utility/radius_utility.dart';
import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 60,
      decoration: BoxDecoration(
          color: ColorsSelection.primary.value(),
          borderRadius: RadiusUtility.minradius),
      child: Center(
          child: Text(
        "£ $price",
        style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 18),
      )),
    );
  }
}
