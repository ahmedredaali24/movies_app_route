import 'package:flutter/material.dart';

class MyTheme {
  ///backGroundColor
  static Color blackColor = const Color(0xff121312);

  ///blackContainerColor
  static Color blackContainerColor = const Color(0xff282A28);

  /// BottomNavigationBarColor
  static Color blackBNBColor = const Color(0xff1A1A1A);

  ///greyColor_ BottomNavigationBar
  static Color greyColor = const Color(0xffC6C6C6);

  ///whiteColor
  static Color whiteColor = const Color(0xffFFFFFF);

  ///yellowColor
  static Color yellowColor = const Color(0xffF7B539);

  ///yellowColor_ BottomNavigationBar
  static Color yellowIconColor = const Color(0xffFFBB3B);

  static ThemeData themeMode = ThemeData(
      scaffoldBackgroundColor: blackColor,
      buttonTheme: ButtonThemeData(buttonColor: whiteColor),
      primaryColor: blackBNBColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: whiteColor, fontSize: 20, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(
            color: whiteColor, fontSize: 18, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(
            color: whiteColor, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowIconColor,
        unselectedItemColor: greyColor,
        elevation: 0,
      ));
}
