import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
  );
}
