import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/logincontroller.dart';

import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/signuppage/signupscreen.dart';
import 'package:real_estate/views/widgets/iconcontainer.dart';

import 'package:real_estate/views/widgets/loginform.dart';
import 'package:real_estate/commonwidgdets/richtext.dart';

import '../widgets/submitbutton.dart';

// Import your controller

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQueryUtil.screenWidth(context);
    final padsize = (screenWidth * .05) + 10;
    //final screenHeight = MediaQuery.of(context).size.height;
    final AuthController controller = Get.put(AuthController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(Imagepath.loginimage),
            ),
            loginform(controller, context),
            SizedBox(
              height: screenWidth * .1,
            ),
            SubmitButton(
              controller: controller,
              buttonname: "Login",
              onPressed: () async {
              if (controller.formKey.currentState!.validate()){
                  await controller.signIn();

              }
                
              },
            ),
            SizedBox(
              height: screenWidth * .2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padsize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  )),
                  SizedBox(
                    width: screenWidth * .02,
                  ),
                  const Text(
                    "OR",
                    style: AppTextStyles.minitext,
                  ),
                  SizedBox(
                    width: screenWidth * .02,
                  ),
                  const Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ))
                ],
              ),
            ),
            SizedBox(
              height: screenWidth * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Iconcontainer(
                    imageicon: Imagepath.googleicon,
                    isgoogle: true,
                   
                   ),
                Iconcontainer(
                  imageicon: Imagepath.mobilemage,
                  isgoogle: false,

                
                
                )
              ],
            ),
            SizedBox(
              height: screenWidth * .05,
            ),
            GestureDetector(
              onTap: () {
                controller.toggleTextTap();
                Get.to(SignupScreen());
              },
              child: Align(
                alignment: Alignment.center,
                child: Obx(() => RichTexts(
                      textspans: [
                        const TextSpan(
                            text: "Don't have an account? ",
                            style: AppTextStyles.minitext),
                        TextSpan(
                          text: "Register",
                          style: TextStyle(
                            color: controller.isTextTapped.value
                                ? AppColors.textPrimarytwo
                                : AppColors.textPrimary,
                            decoration: controller.isTextTapped.value
                                ? TextDecoration.underline
                                : null,
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
