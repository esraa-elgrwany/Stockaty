import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/styles.dart';

class MyThemeData{
  static ThemeData lightTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary:primaryColor, onPrimary:primaryColor, secondary: primaryColor,
        onSecondary:Colors.black, error: Colors.red, onError: Colors.red,
        background:Colors.white,
        onBackground:Colors.white,
        surface:primaryColor,
        onSurface:Colors.grey),

  appBarTheme: AppBarTheme(
  centerTitle: false,
  backgroundColor: Colors.transparent,
  elevation: 0,
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xFF8B96A5),

    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        color:greyColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        color:greyColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color:ThirdPrimary,
      ),
    ),
  );

  static ThemeData darkTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary:primaryColor, onPrimary: Colors.white, secondary:secondPrimary,
        onSecondary:Colors.white, error: Colors.red, onError: Colors.red,
        background:darkBg,
        onBackground:darkGrey,
        surface:darkGrey,
        onSurface:Colors.white),

    scaffoldBackgroundColor: darkBg,
    appBarTheme: AppBarTheme(
       centerTitle: false,
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        color:secondPrimary,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color:greyColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color:ThirdPrimary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: false,
    ),
  );
}