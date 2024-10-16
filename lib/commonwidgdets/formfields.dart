import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.labelIcon,
    this.isPassword = false,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final Icon? labelIcon;
  final bool isPassword;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    RxBool isFocused;
    if (labelText.toLowerCase() == 'full name') {
      isFocused = authController.isFullNameFocused;
    } else if (labelText.toLowerCase() == 'email') {
      isFocused = authController.isEmailFocused;
    } else if (labelText.toLowerCase() == 'password') {
      isFocused = authController.isPasswordFocused;
    } else if (labelText.toLowerCase() == 'confirm password') {
      isFocused = authController.isConfirmPasswordFocused;
    } else {
      throw Exception('Unsupported field label: $labelText');
    }

    return Obx(() {
      return Focus(
        onFocusChange: (hasFocus) {
          isFocused.value = hasFocus;
        },
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.transparent, // Make the border transparent
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.black, // Make the border transparent
                ),
              ),
              filled: true,
              fillColor: AppColors.fieldcolor,
              hintText: labelText,
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isFocused.value ? null : labelIcon,
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
              ),
              suffixIcon: isFocused.value
                  ? isPassword
                      ? GestureDetector(
                          onTap: () {
                            authController.togglePasswordVisibility();
                          },
                          child: Obx(() => Icon(
                                authController.isPasswordVisible.value
                                    ? IconsaxPlusLinear.eye
                                    : IconsaxPlusLinear.eye_slash,
                              )),
                        )
                      : labelIcon
                  : null,
            ),
            obscureText: isPassword && !authController.isPasswordVisible.value,
            validator: validator),
      );
    });
  }
}
