

  import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

Row otpField(double boxwidth, BuildContext context,otpController) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.fieldcolor,
                  ),
                  width: boxwidth,
                  child: TextField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        otpController.setOtpDigit(index, value);
                        if (index < 5) {
                          FocusScope.of(context).nextFocus();
                        }
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.primary, width: 2),
                      ),
                    ),
                  ),
                );
              }),
            );
  }