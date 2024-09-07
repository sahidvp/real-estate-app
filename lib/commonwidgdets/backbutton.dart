import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldcolor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          IconsaxPlusLinear.arrow_left,
          color: Colors.black,
          size: MediaQueryUtil.backbuttonheight(context) * .30,
        ),
        splashRadius: 50,
      ),
    );
  }
}
