// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/commonwidgdets/formfields.dart';
// import 'package:real_estate/commonwidgdets/richtext.dart';
// import 'package:real_estate/controller/logincontroller.dart';

// import 'package:real_estate/model/loginpage/logintexts.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/icons.dart';
// import 'package:real_estate/utils/media_query.dart';
// import 'package:real_estate/views/widgets/submitbutton.dart';

// class SignupScreen extends StatelessWidget {
//   const SignupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//      final AuthController controller = Get.find();
//     final sb=MediaQueryUtil.screenWidth(context)*.05;
//     return SafeArea(
//         child: Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,

//           children: [

//             Container(

//               decoration: BoxDecoration(
//                   color: AppColors.fieldcolor, shape: BoxShape.circle),
//               child: IconButton(

//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.black,
//                     size: MediaQueryUtil.backbuttonheight(context) * .40,
//                   ),
//                   splashRadius: 50,),
//             ),
//             SizedBox(
//               height: sb*2,
//             ),
//             RichTexts(textspans: Logintext.signupText),
//             SizedBox(height: sb,),
//             Text("Enter your details to login",style: AppTextStyles.minitext,),
//             SizedBox(height: sb*1.5,),
//             CustomFormField(controller:controller , labelText:"Full name",labelIcon: Icon(Iconsdata.user), ),
//             SizedBox(height: sb,),
//             CustomFormField(controller: controller, labelText: "Email",labelIcon: Icon(Iconsdata.email),),
//             SizedBox(height: sb,),
//             CustomFormField(controller: controller, labelText: "Password",labelIcon: Icon(Iconsdata.password),),
//             SizedBox(height: sb,),
//             CustomFormField(controller: controller, labelText: "Confirm password",labelIcon: Icon(Iconsdata.password),),
//             SizedBox(height: sb*2,),
//             SubmitButton(controller: controller, buttonname: "Register", onPressed: controller.signup)

//           ],
//         ),
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/commonwidgdets/formfields.dart';
import 'package:real_estate/commonwidgdets/richtext.dart';

import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/model/loginpage/logintexts.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/icons.dart';
import 'package:real_estate/utils/media_query.dart';

import 'package:real_estate/views/widgets/submitbutton.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQueryUtil.screenWidth(context);
    final padsize = (screenWidth * .05) + 5;
    final AuthController controller = Get.find();
    final sb = MediaQueryUtil.screenWidth(context) * .05;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(padsize),
            child: Form(
              key: controller.signupformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ArrowButton(),
                  SizedBox(height: sb * 2),
                  RichTexts(textspans: Logintext.signupText),
                  SizedBox(height: sb),
                  Text(
                    "Enter your details to sign up",
                    style: AppTextStyles.minitext,
                  ),
                  SizedBox(height: sb * 1.5),
                  CustomFormField(
                    controller: controller.fullNameController,
                    labelText: "Full name",
                    labelIcon: Icon(Iconsdata.user),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
                      if (!nameRegExp.hasMatch(value)) {
                        return "Name should contain only alphabets";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: sb),
                  CustomFormField(
                    controller: controller.emailController,
                    labelText: "Email",
                    labelIcon: Icon(Iconsdata.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: sb),
                  CustomFormField(
                    controller: controller.passwordController,
                    labelText: "Password",
                    labelIcon: Icon(Iconsdata.password),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: sb),
                  CustomFormField(
                    controller: controller.confirmPasswordController,
                    labelText: "Confirm password",
                    labelIcon: Icon(Iconsdata.password),
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != controller.passwordController.text) {
                        return 'Passwords does not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: sb * 2),
                  SubmitButton(
                    controller: controller,
                    buttonname: "Register",
                    onPressed: () async {
                      if (controller.signupformKey.currentState!.validate()) {
                        await controller.signUp(
                          userName: controller.fullNameController.text,
                          userEmail: controller.emailController.text,
                          password: controller.passwordController.text,
                          confirmPassword:
                              controller.confirmPasswordController.text,
                          context: context,
                        );
                      }
                      // if (!isAgreedTermsAndConditions!) {
                      //   Get.snackbar(
                      //       "Error", "Please agree to the terms and conditions",
                      //       colorText: AppThemeData.red,
                      //       snackPosition: SnackPosition.BOTTOM);
                      //   return;
                      // }
                      // if (auth.currentUser != null) {
                      //   Get.to(() => const EmailVerificationPage());
                      // }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
