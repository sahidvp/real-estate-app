import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/Loginpage/loginwithmobile/widgets/otpField.dart';
import 'package:real_estate/views/Loginpage/loginwithmobile/widgets/otpresend.dart';
import 'package:real_estate/views/widgets/submitbutton.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});
  final AuthController otpController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final boxwidth = MediaQueryUtil.getWidthPercentage(context, .14);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //  appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter code sent to your phone',
                style: AppTextStyles.minitext2,
              ),
              const SizedBox(height: 20),
              otpField(boxwidth, context, otpController),
              SizedBox(
                height: MediaQueryUtil.getHeightPercentage(context, .08),
              ),
              Obx(() {
                if (otpController.isSubmitting.value) {
                  return CircularProgressIndicator(
                    color: AppColors.primary,
                  );
                }
                return Column(
                  children: [
                    SubmitButton(
                      controller: otpController,
                      buttonname: "Submit",
                      onPressed: () async {
                        await otpController.verifyOtp();

                        otpController.fullNameController.dispose();
                        // Other disposals...
                      },
                    ),
                    SizedBox(
                      height: MediaQueryUtil.getHeightPercentage(context, .05),
                    ),
                    otpResend(otpController)
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
