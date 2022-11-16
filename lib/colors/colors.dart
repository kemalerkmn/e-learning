import 'package:flutter/cupertino.dart';

enum ColorsSelection { primary, white, borderColor, secondary }

extension ColorsExtension on ColorsSelection {
  Color value() {
    switch (this) {
      case ColorsSelection.primary:
        return const Color.fromRGBO(116, 101, 228, 1);
      case ColorsSelection.white:
        return const Color.fromARGB(255, 255, 255, 255);
      case ColorsSelection.borderColor:
        return const Color.fromARGB(31, 83, 83, 83);
      case ColorsSelection.secondary:
        return const Color.fromRGBO(116, 101, 228, .15);
    }
  }
}
