import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

enum SocialMediaIcons {
  facebook,
  google,
  twitter,
}

extension SocialMediaIconsExtension on SocialMediaIcons {
  Widget icon() {
    switch (this) {
      case SocialMediaIcons.facebook:
        return SvgPicture.asset("assets/icons/ic_facebook.svg");
      case SocialMediaIcons.google:
        return SvgPicture.asset("assets/icons/ic_google.svg");
      case SocialMediaIcons.twitter:
        return SvgPicture.asset("assets/icons/ic_twitter.svg");
    }
  }
}
