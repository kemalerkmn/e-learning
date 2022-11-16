import 'package:e_leaning2/colors/colors.dart';
import 'package:e_leaning2/image_and_icon_path/icon_path.dart';
import 'package:e_leaning2/radius_and_padding_utility/radius_utility.dart';
import 'package:flutter/material.dart';

import '../../../image_and_icon_path/image_path.dart';
import '../../../service/auth.dart';
import '../../log_in_screen/log_in_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();

    return Container(
      height: 132,
      width: 355,
      decoration: BoxDecoration(
          color: ColorsSelection.primary.value(),
          borderRadius: RadiusUtility.defaultRaidus),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.subtitle1,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'New Student?\n',
                    ),
                    const TextSpan(text: 'Learning '),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  height: 32,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsSelection.white.value()),
                      onPressed: () {},
                      icon: SVGIcon.rightBackArrow.value(),
                      label: Text(
                        "Categories",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: ColorsSelection.primary.value()),
                      )),
                ),
              ),
            ],
          ),
          GlobalImage.CardImage.image()
        ],
      ),
    );
  }
}
