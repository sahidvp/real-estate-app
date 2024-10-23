import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/indian_rupee.dart';
import 'package:real_estate/utils/colors.dart';

Container bottomBody(
    double screenHeight, double screenWidth, String totalPrice) {
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
            SizedBox(
              width: screenWidth * .3,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Token",
                  style: AppTextStyles.headline6,
                ),
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: AppColors.primary),
              ),
            )
          ],
        ),
      ));
}
