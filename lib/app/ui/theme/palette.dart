import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor ktodark =
      MaterialColor(_ktodarkPrimaryValue, <int, Color>{
    50: Color(0xFFE9F1EE),
    100: Color(0xFFC8DBD5),
    200: Color(0xFFA4C4BA),
    300: Color(0xFF80AC9E),
    400: Color(0xFF649A89),
    500: Color(_ktodarkPrimaryValue),
    600: Color(0xFF42806C),
    700: Color(0xFF397561),
    800: Color(0xFF316B57),
    900: Color(0xFF215844),
  });
  static const int _ktodarkPrimaryValue = 0xFF498874;
}
