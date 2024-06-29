import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color.fromARGB(222, 82, 139, 38);
  static const Color primaryLight = Color(0xFFB8E986);
  static const Color primaryDark = Color(0xFF5A9216);

  static const Color secondary = Color(0xFFF5A623);
  static const Color secondaryLight = Color(0xFFFFBC6B);
  static const Color secondaryDark = Color(0xFFC38217);

  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;

  static const Color textPrimary = Color.fromARGB(255, 24, 80, 115);
  static const Color textPrimarytwo = Color.fromARGB(255, 54, 45, 120);

  static const Color textSecondary = Colors.white;
  static const Color fieldcolor =  Color(0xFFF5F4F8);

  static const Color iconPrimary = Colors.black;
  static const Color iconSecondary = Color.fromARGB(255, 200, 197, 197);
  static const Color unselectitem = Color(0xFF8895A7);

  // Add more colors as needed
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static const TextStyle headline6 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.textSecondary);


  static const TextStyle bodyText2 =
      TextStyle(fontSize: 15, color: AppColors.textPrimary,fontWeight: FontWeight.w500,decoration: TextDecoration.underline);

  static const TextStyle bodytext3 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimarytwo);

      
  static const TextStyle bodyText4 =
      TextStyle(fontSize: 28, color: AppColors.textPrimary,
      fontWeight: FontWeight.bold);

      static const TextStyle minitext =
      TextStyle(fontSize: 12, color: AppColors.textPrimarytwo,
      fontWeight: FontWeight.w400);

  // Add more text styles as needed
}
