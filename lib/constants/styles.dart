import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyle {
  static TextStyle heading = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle title = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static TextStyle subtitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.lightTextColor,
  );
  static TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.white.withOpacity(0.8),
  );
  static TextStyle caption = const TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
  );
}
