import 'package:flutter/material.dart';

class AppColors {
  static final Color backgroundColor = hexToColor("#E5E5E5");

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
