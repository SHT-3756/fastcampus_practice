import 'package:flutter_application_heetae/components/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: CustomColors.primaryMaterialColor,
        fontFamily: 'GmarketSansTTF',
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.white,
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        brightness: Brightness.light,
      );
  static ThemeData get darkTheme => ThemeData(
        primarySwatch: CustomColors.primaryMaterialColor,
        fontFamily: 'GmarketSansTTF',
        splashColor: Colors.white,
        textTheme: _textTheme,
        brightness: Brightness.dark,
      );

  static const AppBarTheme _appBarTheme = AppBarTheme(
      // 배경색 흰색으로 바꿔준다.
      backgroundColor: Colors.white,
      // theme 에서 iconTheme 로 스타일을 변경해주었다. (따로 만든 CustomColors 도 적용)
      iconTheme: IconThemeData(color: CustomColors.primaryColor),
      elevation: 0);

  static const TextTheme _textTheme = TextTheme(
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    button: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w200,
    ),
  );
}
