import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum SVGIcon {
  drawer,
  backArrow,
  notification,
  search,
  voice,
  rightBackArrow,
  sized,
}

extension SVGIconExtension on SVGIcon {
  Widget value() {
    switch (this) {
      case SVGIcon.drawer:
        return SvgPicture.asset("assets/icons/ic_drawer_menu.svg");
      case SVGIcon.sized:
        return SvgPicture.asset("assets/icons/ic_sized.svg");
      case SVGIcon.rightBackArrow:
        return SvgPicture.asset("assets/icons/ic_arrow_right.svg");
      case SVGIcon.backArrow:
        return SvgPicture.asset("assets/icons/ic_back_arrow.svg");
      case SVGIcon.notification:
        return SvgPicture.asset("assets/icons/ic_notification.svg");
      case SVGIcon.search:
        return Image.asset(
          "assets/icons/ic_search.png",
          height: 2,
        );
      case SVGIcon.voice:
        return Image.asset("assets/icons/ic_voice.png");
    }
  }
}
