// import 'package:flutter/material.dart';

// class OtpVerificationPage extends StatelessWidget {
//   const OtpVerificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/utils/colors.dart';


import '../../controller/logincontroller.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({super.key});
  final ctrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter code sent to your phone',
              style:AppTextStyles.bodyText4,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: TextFormField(
                controller: ctrl.otp,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter code",
                  hintStyle:AppTextStyles.minitext,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide:
                        BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.55,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                     AppColors.primary,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () async {
                  await ctrl.verifyOtp();
                },
                child: Text(
                  'Verify',
                  style: AppTextStyles.bodyText2,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.55,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primary,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () async {
                  await ctrl.sentOtp();
                },
                child: Text(
                  'Resent OTP',
                  style: AppTextStyles.bodyText2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: AppColors.primary,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.045),
          ],
        ),
      ),
    );
  }
}