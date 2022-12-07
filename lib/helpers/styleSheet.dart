// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFD6DC16);
  static const Color greyColor = Color(0xFF9A9A9A);
  static const Color blackColor = Colors.black;
  static const Color whiteColor = Color(0xffffffff);
  static const Color redColor = Color(0xffff1700);
  static const Color buttonCancelColor = Color(0xfffccc50);

  static const Color grey50 = Color.fromARGB(255, 245, 243, 243);
}

class GetTextTheme {
  /* Bold Fonts Group */
  static TextStyle sf32_Bold =
      GoogleFonts.openSans(fontSize: 32.sp, fontWeight: FontWeight.w700);
  static TextStyle sf25_Bold =
      GoogleFonts.openSans(fontSize: 25.sp, fontWeight: FontWeight.w700);
  static TextStyle sf22_Bold =
      GoogleFonts.openSans(fontSize: 22.sp, fontWeight: FontWeight.w700);
  static TextStyle sf20_Bold =
      GoogleFonts.openSans(fontSize: 20.sp, fontWeight: FontWeight.w700);
  static TextStyle sf18_Bold =
      GoogleFonts.openSans(fontSize: 18.sp, fontWeight: FontWeight.w700);
  static TextStyle sf16_Bold =
      GoogleFonts.openSans(fontSize: 16.sp, fontWeight: FontWeight.w700);
  static TextStyle sf14_Bold =
      GoogleFonts.openSans(fontSize: 14.sp, fontWeight: FontWeight.w700);
  static TextStyle sf12_Bold =
      GoogleFonts.openSans(fontSize: 12.sp, fontWeight: FontWeight.w700);
  static TextStyle sf10_Bold =
      GoogleFonts.dmSans(fontSize: 10.sp, fontWeight: FontWeight.w700);

  /* Regular  Fonts Group */
  static TextStyle sf22_regular =
      GoogleFonts.openSans(fontSize: 22.sp, fontWeight: FontWeight.w400);
  static TextStyle sf18_Regular =
      GoogleFonts.openSans(fontSize: 18.sp, fontWeight: FontWeight.w400);
  static TextStyle sf16_Regular =
      GoogleFonts.openSans(fontSize: 16.sp, fontWeight: FontWeight.w400);
  static TextStyle sf14_Regular =
      GoogleFonts.openSans(fontSize: 14.sp, fontWeight: FontWeight.w400);
  static TextStyle sf12_Regular =
      GoogleFonts.openSans(fontSize: 12.sp, fontWeight: FontWeight.w400);
  static TextStyle sf10_regular =
      GoogleFonts.openSans(fontSize: 10.sp, fontWeight: FontWeight.w400);
}
