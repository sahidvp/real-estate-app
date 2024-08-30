import 'package:flutter/material.dart';
import 'package:get/get.dart';

// errorSnackBar(String title, String message) {
//   Get.snackbar(title, message,
//       snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red,colorText: Colors.white);
// }
void errorSnackBar({String title = 'Failed', String message = ""}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.transparent,
    colorText: Colors.redAccent,
    margin: EdgeInsets.all(10),
    borderRadius: 3,
    padding: EdgeInsets.all(16),
    snackStyle: SnackStyle.FLOATING,
  );
}
