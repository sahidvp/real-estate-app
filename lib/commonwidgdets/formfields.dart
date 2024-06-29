// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/utils/colors.dart';

// class CustomFormField extends StatelessWidget {
//   const CustomFormField({
//     super.key,
//     required this.namecontroller,
//     required this.labelText,
//     this.labelIcon,
//     this.isPassword = false,
//   });

//   final TextEditingController namecontroller;

//   final String labelText;
//   final Icon? labelIcon;
//   final bool isPassword;

//   @override
//   Widget build(BuildContext context) {
//     final AuthController controller = Get.find();
//     // Determine which focus state to use based on the field type
//     final RxBool isFocused =
//         isPassword ? controller.isPasswordFocused : controller.isEmailFocused;

//     return Obx(() {
//       return Focus(
//         onFocusChange: (hasFocus) {
//           isFocused.value = hasFocus;
//         },
//         child: TextFormField(
//           controller: isPassword
//               ? controller.passwordController
//               : controller.emailController,
//           decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: Colors.transparent, // Make the border transparent
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(
//                 color: Colors.black, // Make the border transparent
//               ),
//             ),
//             filled: true,
//             fillColor: AppColors.fieldcolor,
//             hintText: labelText,
//             hintStyle: TextStyle(color: Colors.grey),
//             prefixIcon: isFocused.value ? null : labelIcon,
//             suffixIcon: isFocused.value
//                 ? isPassword
//                     ? GestureDetector(
//                         onTap: () {
//                           controller.isPasswordVisible.value =
//                               !controller.isPasswordVisible.value;
//                         },
//                         child: Icon(
//                           controller.isPasswordVisible.value
//                               ? IconsaxPlusLinear.eye
//                               : IconsaxPlusLinear.eye_slash,
//                         ),
//                       )
//                     : labelIcon
//                 : null,
//           ),
//           obscureText: isPassword && !controller.isPasswordVisible.value,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter your $labelText';
//             } else if (labelText.toLowerCase() == 'email' &&
//                 !GetUtils.isEmail(value)) {
//               return 'Please enter a valid email';
//             }
//             return null;
//           },
//         ),
//       );
//     });
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';

// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/utils/colors.dart';

// class CustomFormField extends StatelessWidget {
//   const CustomFormField({
//     Key? key,
//     required this.controller,
//     required this.labelText,
//     this.labelIcon,
//     this.isPassword = false,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String labelText;
//   final Icon? labelIcon;
//   final bool isPassword;

//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.find();

//     return Obx(() {
//       final RxBool isFocused =
//       //  isPassword
//       //     ? authController.isPasswordFocused.value.obs
//       //     : authController.isEmailFocused.value.obs;
//            isPassword ? authController.isPasswordFocused : authController.isEmailFocused;

//       return Focus(
//         onFocusChange: (hasFocus) {
//           isFocused.value = hasFocus;
//         },
//         child: TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(
//                 color: Colors.transparent, // Make the border transparent
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(
//                 color: Colors.black, // Make the border transparent
//               ),
//             ),
//             filled: true,
//             fillColor: AppColors.fieldcolor,
//             hintText: labelText,
//             hintStyle: const TextStyle(color: Colors.grey),
//              prefixIcon: isFocused.value ? null : labelIcon,
//             // AnimatedSwitcher(
//             //   duration: Duration(milliseconds: 200),
//             //   child: isFocused.value ? null : labelIcon,
//             //   transitionBuilder: (Widget child, Animation<double> animation) {
//             //     return ScaleTransition(
//             //       scale: animation,
//             //       child: child,
//             //     );
//             //   },
//             // ),
//             suffixIcon: 
//             isFocused.value
//                 ? isPassword
//                     ? GestureDetector(
//                         onTap: () {
//                           authController.togglePasswordVisibility();
//                         },
//                         child: Obx(() => Icon(
//                               authController.isPasswordVisible.value
//                                   ? IconsaxPlusLinear.eye
//                                   : IconsaxPlusLinear.eye_slash,
//                             )),
//                       )
//                     : labelIcon
//                 : null,
//           ),
//           obscureText: isPassword && !authController.isPasswordVisible.value,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter your $labelText';
//             } else if (labelText.toLowerCase() == 'email' &&
//                 !GetUtils.isEmail(value)) {
//               return 'Please enter a valid email';
//             }
//             return null;
//           },
//         ),
//       );
//     });
//   }
// }


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
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final Icon? labelIcon;
  final bool isPassword;

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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $labelText';
            } else if (labelText.toLowerCase() == 'email' &&
                !GetUtils.isEmail(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ),
      );
    });
  }
}
