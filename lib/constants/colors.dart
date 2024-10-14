import 'package:flutter/material.dart';

class AppColors {
  static const backgroundColor = Color(0xFF101630);
  static const textColor = Color(0xFF29335A);
  static const lightTextColor = Color(0xFF4FBADD);
  static const white = Colors.white;
  static const outlinedButtonColor = Color(0xFF4729bf);
  static const buttonGradient = LinearGradient(
    colors: [
      Color(0xFF4ea3d7),
      outlinedButtonColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
