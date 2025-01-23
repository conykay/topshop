import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:topshop/core/configs/theme/app_colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.robotoCondensed().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColors.secondBackground,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        minimumSize: Size.fromHeight(50),
      ),
    ),
  );
}
