// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

enum GlobalImage {
  MainIcon,
  CardImage,
  PlayImage,
  PlayImageFalse,
}

extension GlobalImageExtension on GlobalImage {
  Widget image() {
    switch (this) {
      case GlobalImage.MainIcon:
        return Image.asset("assets/img/img_welcome.png");
      case GlobalImage.PlayImageFalse:
        return Image.asset("assets/img/img_play_false.png");

      case GlobalImage.PlayImage:
        return Image.asset("assets/img/img_play.png");

      case GlobalImage.CardImage:
        return Image.asset("assets/img/img_card_bg.png");
    }
  }
}
