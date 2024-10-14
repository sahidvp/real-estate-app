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
  static const Color screenColor = Color.fromARGB(255, 245, 242, 242);

  static const Color textSecondary = Colors.white;
  static final Color fieldcolor = Colors.grey.shade200;

  static const Color iconPrimary = Colors.black;
  static const Color iconSecondary = Color.fromARGB(255, 200, 197, 197);
  static const Color unselectitem = Color(0xFF8895A7);

  // Add more colors as needed
}

class AppTextStyles {
  static const TextStyle headline1 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static const TextStyle headline6 = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: AppColors.textSecondary);

  static const TextStyle bodyText2 = TextStyle(
      fontSize: 15,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline);
  static const TextStyle hompagebodyText = TextStyle(
    fontSize: 12,
    color: AppColors.textPrimary,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle hompagebodyText2 = TextStyle(
    fontSize: 13,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodytext3 = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: AppColors.textPrimarytwo);
  static const TextStyle priceText = TextStyle(
      color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 17);

  static const TextStyle bodyText4 = TextStyle(
      fontSize: 28, color: AppColors.textPrimary, fontWeight: FontWeight.bold);

  static const TextStyle minitext = TextStyle(
      fontSize: 12,
      color: AppColors.textPrimarytwo,
      fontWeight: FontWeight.w400);
  static const TextStyle propertyLocation = TextStyle(
      fontWeight: FontWeight.w500,
      //  fontSize: 15,
      color: Color(0xFFB9B9B9));

  static const TextStyle propertyTitle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black);
  static const TextStyle minitext2 = TextStyle(
      fontSize: 15, color: AppColors.textPrimary, fontWeight: FontWeight.w400);
  static const TextStyle mainHeading = TextStyle(
      fontWeight: FontWeight.w500, color: AppColors.textPrimary, fontSize: 20);
  static const TextStyle subHeading = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.iconPrimary,
    fontSize: 16,
  );
  static const TextStyle minitext3 =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w500);

  static const TextStyle locationtext = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 12, color: Color(0xFFB9B9B9));
  static const TextStyle categorytag = TextStyle(
      color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold);
  static const TextStyle propertyText =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const TextStyle featurecount =
      TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimarytwo);

  // Add more text styles as needed
}

class AppDecoration {
  static final boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.3), // Shadow color
    spreadRadius: 2, // Spread radius
    blurRadius: 10, // Blur radius
    offset: Offset(0, 5), // Offset in x and y direction
  );
}
