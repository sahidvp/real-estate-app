import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/Loginpage/loginscreen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 79,
      child: ElevatedButton(
          onPressed: () {
            Get.to(() => Loginscreen());
          },
          child: const Text(
            "Skip",
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.fieldcolor)),
    );
  }
}
