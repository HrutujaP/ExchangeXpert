import 'dart:ui';

import 'package:collection/collection.dart';

class Palette {
  static const List<Color> colors = [
    Color(0xff989898),
    Color(0xffe04038),
    Color(0xffe06638),
    Color(0xfff0b020),
    Color(0xffe8e850),
    Color(0xff68c860),
    Color(0xff48ac40),
    Color(0xff40ac9e),
    Color(0xff4888e8),
    Color(0xff2838e0),
    Color(0xff8050e8),
    Color(0xffc060c8),
  ];

  static Color getUnusedColor(List<Color> usedColors) {
    return colors.firstWhereOrNull((color) => !usedColors.contains(color)) ?? colors[0];
  }
}
