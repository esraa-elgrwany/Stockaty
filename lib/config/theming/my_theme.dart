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

    scaffoldBackgroundColor:Colors.white,
    appBarTheme: AppBarTheme(
        color: primaryColor,
        iconTheme: IconThemeData(
            color: Colors.white
        )
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primaryColor,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.white,),

    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color:Colors.black,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color:primaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color:Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme=ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary:primaryColor, onPrimary: Colors.white, secondary:darkPrimary,
        onSecondary:Colors.white, error: Colors.red, onError: Colors.red,
        background:darkBg,
        onBackground:darkgrey,
        surface:darkgrey,
        onSurface:Colors.white),

    scaffoldBackgroundColor: darkBg,
    appBarTheme: AppBarTheme(
        color: primaryColor,
        iconTheme: IconThemeData(
            color: Colors.white
        )
    ),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color:Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color:primaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color:Colors.black,
      ),
    ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkPrimary,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
      )
  );
}