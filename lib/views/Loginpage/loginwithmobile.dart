import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/commonwidgdets/richtext.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/Loginpage/widgets/phonenumberfield.dart';
import 'package:real_estate/views/widgets/submitbutton.dart';

class OtpScreen extends StatelessWidget {
  final AuthController _authController = Get.find();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.screenWidth(context) * .05;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ArrowButton(),
                SizedBox(height: sb * 2),
                const RichTexts(textspans: [
                  TextSpan(
                      text: "Enter your mobile number",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary))
                ]),
                SizedBox(height: sb * 1.5),
                const RichTexts(
                  textspans: [
                    TextSpan(
                        text:
                            "please confirm your country code and \nenter your mobile number",
                        style: TextStyle(color: Colors.black))
                  ],
                ),
                SizedBox(
                  height: sb + 10,
                ),
                PhonenNumberfield(),
                SizedBox(
                  height: sb + 15,
                ),
                SubmitButton(
                    controller: _authController,
                    buttonname: "Send otp",
                    onPressed: () {
                      _authController.sentOtp();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
