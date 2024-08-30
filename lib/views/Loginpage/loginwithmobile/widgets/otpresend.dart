
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/richtext.dart';
import 'package:real_estate/utils/colors.dart';

GestureDetector otpResend(otpController) {
    return GestureDetector(
                    onTap: () async {
                      otpController.toggleTextTap();
                      await otpController.verifyOtp();
                      otpController.toggleTextTap();
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Obx(() => RichTexts(
                            textspans: [
                              const TextSpan(
                                  text: "Didn't receive OTP? ",
                                  style: TextStyle(
                                      color: Color.fromARGB(
                                          255, 118, 114, 114))),
                              TextSpan(
                                text: "Resend OTP",
                                style: TextStyle(
                                    color: otpController.isTextTapped.value
                                        ? AppColors.textPrimarytwo
                                        : AppColors.textPrimary,
                                    decoration:
                                        otpController.isTextTapped.value
                                            ? TextDecoration.underline
                                            : null,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ),
                  );
  }

