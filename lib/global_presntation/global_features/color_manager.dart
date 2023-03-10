import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#D84E67");
  static Color secondary = HexColor.fromHex("#FFD24A");
  static Color secondryTextColor = HexColor.fromHex("#707070");
  static Color borderColor = HexColor.fromHex('#FAFAFA');
  static Color unSelectedBorder = HexColor.fromHex("#EEF1F5");
  static Color hintTextColor = HexColor.fromHex('#757A86');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
