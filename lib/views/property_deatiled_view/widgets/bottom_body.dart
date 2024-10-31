import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/indian_rupee.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/razorpay_payment.dart/payment.dart';
import 'package:real_estate/views/userprofile/screens/my_properties/widgets/edit_remove.dart';

Container bottomBody(
    double screenHeight, double screenWidth, String totalPrice, String userId) {
  return Container(
      decoration: BoxDecoration(
          border:
              Border(top: BorderSide(color: AppColors.fieldcolor, width: 2)),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      height: screenHeight * .08,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(children: [
                Text(
                  "Total price",
                  style: AppTextStyles.minitext3,
                ),
                Text(
                  indianRupee(totalPrice),
                  style: AppTextStyles.priceText,
                )
              ]),
            ),
            userId != auth.currentUser!.uid
                ? SizedBox(
                    width: screenWidth * .3,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => PaymentScreen());
                      },
                      child: Row(children: [
                        Expanded(
                          child: SvgPicture.asset(
                            Imagepath.token,
                            width: 25,
                          ),
                        )
                      ]),
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          backgroundColor: AppColors.primary),
                    ),
                  )
                : editRemove(screenWidth, "Edit")
          ],
        ),
      ));
}
