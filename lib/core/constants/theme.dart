import 'package:flutter/material.dart';
import 'package:shop_savvy_admin/core/constants/color.dart';

ThemeData englishTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(28),
        bottomRight: Radius.circular(28),
      ),
    ),
    elevation: 0,
    backgroundColor: AppColors.secondaryColor,
  ),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "RobotoMono",
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 26,
    ),
    bodyLarge: TextStyle(
      height: 2,
      fontSize: 18,
      color: AppColors.grey,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.deepOrangeAccent,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      height: 1.5,
      fontSize: 12,
      color: AppColors.grey,
      fontWeight: FontWeight.w300,
    ),
  ),
  primarySwatch: Colors.blue,
);
ThemeData arabicTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20,
    ),
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 26,
    ),
    bodyLarge: TextStyle(
      height: 2,
      fontSize: 18,
      color: AppColors.grey,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.deepOrangeAccent,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      height: 1.5,
      fontSize: 12,
      color: AppColors.grey,
      fontWeight: FontWeight.w300,
    ),
  ),
  primarySwatch: Colors.blue,
);
