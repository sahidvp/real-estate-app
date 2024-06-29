import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';



class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final AuthController ctrl = Get.find<AuthController>();
  Timer? timer;
  bool showProgressIndicator = true;

  @override
  void initState() {
    super.initState();
    // Check the email verification status when the page is initialized
    ctrl.checkEmailVerified();
    startTimer();
  }

  startTimer() {
    timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        showProgressIndicator = false;
      });
    });
  }

  restartTimer() {
    timer?.cancel();
    setState(() {
      showProgressIndicator = true;
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() {
          // Display different UI based on email verification status
          if (ctrl.isEmailVerified.value) {
            return Center(
              child: Text(
                "Email Successfully Verified",
                style: AppTextStyles.minitext,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      'Check your Email',
                      style: AppTextStyles.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Center(
                      child: Text(
                        'We have sent you an email on ${FirebaseAuth.instance.currentUser?.email}',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.minitext,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ctrl.emailVerified.value
                        ? Text(
                            "verified",
                            style:AppTextStyles.headline6,
                          )
                        : showProgressIndicator
                            ? CircularProgressIndicator(
                                color: AppColors.primary,
                              )
                            : GestureDetector(
                                onTap: () {
                                  restartTimer();
                                  ctrl.checkEmailVerified();
                                },
                                child: Icon(
                                  Icons.refresh_rounded,
                                  size: 30,
                                  color: AppColors.primary,
                                ),
                              ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Center(
                      child: Text(
                        showProgressIndicator
                            ? 'Verifying email....'
                            : "Retry...",
                        textAlign: TextAlign.center,
                        style:AppTextStyles.minitext,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: const Icon(
                  //     Icons.refresh_rounded,
                  //     size: 30,
                  //     color: Color(0xFF00704A),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:AppColors.primary
                      ),
                      child: Text(
                        'Resend',
                        style:AppTextStyles.headline6,
                      ),
                      onPressed: () {
                        try {
                          FirebaseAuth.instance.currentUser
                              ?.sendEmailVerification();
                        } catch (e) {
                          debugPrint('$e');
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}