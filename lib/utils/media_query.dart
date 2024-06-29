import 'package:flutter/material.dart';

class MediaQueryUtil {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidthPercentage(BuildContext context, double percentage) {
    return screenWidth(context) * percentage;
  }

  static double getHeightPercentage(BuildContext context, double percentage) {
    return screenHeight(context) * percentage;
  }

  static double backbuttonwidth(BuildContext context, {double percentage=.13}) {
    return screenWidth(context) * percentage;
  }

  static double backbuttonheight(BuildContext context, {double percentage=.08}) {
    return screenHeight(context) * percentage;
  }

  // static bool isPortrait(BuildContext context) {
  //   return MediaQuery.of(context).orientation == Orientation.portrait;
  // }

  // static bool isLandscape(BuildContext context) {
  //   return MediaQuery.of(context).orientation == Orientation.landscape;
  // }
}
