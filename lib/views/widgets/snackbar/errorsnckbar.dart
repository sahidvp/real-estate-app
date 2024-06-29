import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red,colorText: Colors.white);
}