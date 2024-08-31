import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/listing_property/addproperty_screen.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .05);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Select category', style: AppTextStyles.mainHeading),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCateory(Imagepath.houseandothers, "House", sb),
            SizedBox(
              height: sb * .5,
            ),
            buildCateory(Imagepath.land, "Land", sb)
          ],
        ),
      ),
    );
  }

  GestureDetector buildCateory(String svgicon, String textdata, sb) {
    return GestureDetector(
      onTap: () {
        if (svgicon == Imagepath.houseandothers) {
          Get.to(() => const AddPropertyscreen());
        } else {
          // Handle other categories or do nothing
        }
      },
      child: Container(
        width: sb * 5,
        height: sb * 2,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              svgicon,
              height: sb,
            ),
            Text(
              textdata,
              style: AppTextStyles.headline1,
            )
          ],
        ),
      ),
    );
  }
}
