import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/formfields.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/model/loginpage/logintexts.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/icons.dart';
import 'package:real_estate/commonwidgdets/richtext.dart';
import 'package:real_estate/utils/media_query.dart';

Container loginform(AuthController controller,context) {
  
  final sb=MediaQueryUtil.screenWidth(context)*.05;
   // final screenHeight = MediaQuery.of(context).size.height;
  return Container(
    
      
    padding:  EdgeInsets.symmetric(horizontal: sb+10),
    child: Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RichTexts(textspans: Logintext.signinText),
          SizedBox(height: sb),
          const Text(
            "Enter your credentials to login",
            style: AppTextStyles.minitext,
          ),
           SizedBox(
            height: sb,
          ),
          CustomFormField(
              controller: controller.logemailController,
              labelText: "Email",
              labelIcon: Icon(Iconsdata.email)),
           SizedBox(
            height: sb,
          ),
          CustomFormField(
            controller: controller.logpasswordController,
            labelText: "Password",
            labelIcon: Icon(Iconsdata.password),
            isPassword: true,
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: Text(
              "Forgot password?",
              style: AppTextStyles.minitext,
            ),
          ),
        
        ],
      ),
    ),
  );
}
