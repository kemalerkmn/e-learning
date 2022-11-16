import 'package:flutter/material.dart';

import '../../../image_and_icon_path/icon_path.dart';
import '../../../radius_and_padding_utility/radius_utility.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = "Search for the course...";
    return SizedBox(
      height: 48,
      width: 355,
      child: TextField(
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black45, width: 2),
              borderRadius: RadiusUtility.minradius,
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black45, width: 2),
              borderRadius: RadiusUtility.minradius,
            ),
            prefixIcon: SVGIcon.search.value(),
            hintText: text,
            hintStyle: Theme.of(context).textTheme.subtitle2,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: SVGIcon.voice.value(),
            )),
      ),
    );
  }
}
