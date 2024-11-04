import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/Loginpage/loginscreen.dart';

showConfirmationDialog(BuildContext context) {
  final aCtrl = Get.put(AuthController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: Text(
          'Confirm Deletion',
          style: AppTextStyles.headline6,
        ),
        content: Text(
          'Are you sure you want to Sign out?',
          style: AppTextStyles.headline6,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'no',
              style: AppTextStyles.headline6,
            ),
          ),
          TextButton(
            onPressed: () async {
              aCtrl.signOut();
              Get.back();

              Get.offAll(() => const Loginscreen());
            },
            child: Text(
              'Yes',
              style: AppTextStyles.headline6,
            ),
          ),
        ],
      );
    },
  );
}
