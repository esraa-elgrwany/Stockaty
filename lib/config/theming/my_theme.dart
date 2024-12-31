import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/app_colors.dart';


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

}