import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/constants/fonts.dart';

class MyColor {
  MyColor._();

  static final ThemeData theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: MyColor.blue,
      onSurface: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MyColor.blue,
      foregroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: MyFont.semiBold,
        fontSize: 16.sp,
        color: Colors.black,
      ),
    ),
    fontFamily: "Poppins-Regular",
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.sp,
        color: Colors.white,
        fontFamily: "Poppins-SemiBold",
      ),
      bodyText2: TextStyle(
        fontSize: 18.sp,
        color: Colors.black,
        fontFamily: "Poppins-SemiBold",
      ),
      headline1: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontFamily: "Poppins-Bold",
      ),
      headline2: TextStyle(
        fontSize: 20.sp,
        color: Colors.white,
        fontFamily: "Poppins-SemiBold",
      ),
      headline3: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
        fontFamily: "Poppins-SemiBold",
      ),
      headline4: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontFamily: "Poppins-SemiBold",
      ),
      headline5: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontFamily: "Poppins-Regular",
      ),
      headline6: TextStyle(
        fontSize: 12.sp,
        color: Colors.black,
        fontFamily: "Poppins-Regular",
      ),
    ),
  );

  static const Color blue = Color(0xFF0E86D4);
  static const Color blue2 = Color.fromARGB(106, 104, 186, 227);
  static const Color grey = Color(0xFFECECEC);
}
