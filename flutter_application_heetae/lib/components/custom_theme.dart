import 'package:flutter_application_heetae/components/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'GmarketSansTTF',
        textTheme: _textTheme,
      );

  static const TextTheme _textTheme = TextTheme(
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryColor,
    ),
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: CustomColors.primaryColor,
    ),
    subtitle2: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: CustomColors.primaryColor,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: CustomColors.primaryColor,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: CustomColors.primaryColor,
    ),
    button: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w200,
      color: CustomColors.primaryColor,
    ),
  );
}
