import 'package:flutter/material.dart';
import 'package:get/get.dart';



successSnackbar(String title, String despription) {
  Get.snackbar(title, despription,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.white,colorText: Colors.green);
}