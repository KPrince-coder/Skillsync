import 'package:flutter/material.dart';

class AppColors {
  static final Color primaryDark = HexColor.fromHex("#386641");
  static final Color primary = HexColor.fromHex("#6a994e");
  static final Color secondary = HexColor.fromHex("#d90429");
  static final Color tertiary = HexColor.fromHex("#386641");
  static final Color dark = HexColor.fromHex("#1b263b");
  static final Color lightDark = HexColor.fromHex("#8b8c89");
  static final Color light = HexColor.fromHex("#ffffff");
  static final Color lightGray = HexColor.fromHex("#e7ecef");
  static final Color gray = HexColor.fromHex("#adb5bd");
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write("ff");
    buffer.write(hexString.replaceFirst("#", ""));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
