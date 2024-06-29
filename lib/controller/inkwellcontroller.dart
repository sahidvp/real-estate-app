// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/model/loginpage/logintexts.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/imagespath.dart';
// import 'package:real_estate/views/Loginpage/widgets/iconcontainer.dart';
// import 'package:real_estate/views/Loginpage/widgets/loginform.dart';
// import 'package:real_estate/views/Loginpage/widgets/richtext.dart';
// import 'widgets/submitbutton.dart';

// class Loginscreen extends StatelessWidget {
//   const Loginscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final padsize = (screenWidth * .05) + 10;
//     final LoginController controller = Get.put(LoginController());

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: Image.asset(Imagepath.loginimage),
//             ),
//             loginform(controller, context),
//             SizedBox(
//               height: screenWidth * .1,
//             ),
//             SubmitButton(
//               controller: controller,
//               buttonname: "Login",
//             ),
//             SizedBox(
//               height: screenWidth * .2,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: padsize),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Expanded(
//                       child: Divider(
//                     color: Colors.grey,
//                     thickness: 1,
//                   )),
//                   SizedBox(
//                     width: screenWidth * .02,
//                   ),
//                   const Text(
//                     "OR",
//                     style: AppTextStyles.minitext,
//                   ),
//                   SizedBox(
//                     width: screenWidth * .02,
//                   ),
//                   const Expanded(
//                       child: Divider(
//                     color: Colors.grey,
//                     thickness: 1,
//                   )),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: screenWidth * .05,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Iconcontainer(imageicon: Imagepath.googleicon),
//                 Iconcontainer(imageicon: Imagepath.mobilemage),
//               ],
//             ),
//             SizedBox(
//               height: screenWidth * .05,
//             ),
//             GestureDetector(
//               onTap: () {
//                 controller.toggleTextTap();
//                 Get.to(() => const RegistrationScreen()); // Navigate to the registration page
//               },
//               child: Obx(() => Align(
//                 alignment: Alignment.center,
//                 child: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                           text: "Don't have an account? ",
//                           style: AppTextStyles.minitext.copyWith(
//                             color: controller.isTextTapped.value
//                                 ? Colors.red
//                                 : AppColors.linkColor,
//                           )),
//                       TextSpan(
//                           text: "Register",
//                           style: AppTextStyles.bodyText2.copyWith(
//                             color: controller.isTextTapped.value
//                                 ? Colors.red
//                                 : AppColors.linkColor,
//                           )),
//                     ],
//                   ),
//                 ),
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
