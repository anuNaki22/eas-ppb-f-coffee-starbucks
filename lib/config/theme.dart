import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColorDark: kLightStrokeColor,
  primaryColorLight: kLightFillColor,
  primaryColor: kLightPrimary,
  shadowColor: Colors.white,
  cardColor: const Color(0xffF1F3F6),
  dividerColor: kLightDividerColor,
  iconTheme: const IconThemeData(
    color: Color(0xFF3A4276),
  ),
  textTheme: TextTheme(
    labelLarge: GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF74AA7F),
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: kLightTextColor,
    ),
    titleMedium: GoogleFonts.bebasNeue(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF2D2D2D),
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF959595),
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: kLightPrimary),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: kDarkPrimary,
  primaryColorDark: kDarkStrokeColor,
  shadowColor: kDarkStrokeColor,
  primaryColorLight: kDarkFillColor,
  dividerColor: kDarkDividerColor,
  iconTheme: const IconThemeData(
    color: Color(0xff7b7f9e),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF7D7D7D),
    ),
    border: InputBorder.none,
    filled: true,
    fillColor: const Color(0xFF1AA570),
  ),
  cardColor: const Color(0xFF1AA570),
  textTheme: TextTheme(
    labelLarge: GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: kDarkPrimary,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF74AA7F),
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: kLightTextColor,
    ),
    titleMedium: GoogleFonts.bebasNeue(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF1AA570),
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: kDarkFillColor),
);
