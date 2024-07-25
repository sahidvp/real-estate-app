import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';


successSnackbar(String title, String despription) {
  Get.snackbar(title, despription,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white,colorText: Colors.green);
}