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
      body: Stack(children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, AppColors.iconSecondary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Center(
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
      ]),
    );
  }

  GestureDetector buildCateory(String svgicon, String textdata, sb) {
    return GestureDetector(
      onTap: () {
        if (svgicon == Imagepath.houseandothers) {
          Get.to(() => const AddPropertyscreen(
                isLand: false,
              ));
        } else {
          Get.to(() => AddPropertyscreen(isLand: true));
          // Handle other categories or do nothing
        }
      },
      child: Container(
        width: sb * 5,
        height: sb * 1.5,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: sb,
              width: sb,
              child: SvgPicture.asset(
                svgicon,
              ),
            ),
            SizedBox(
              width: sb * .5,
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
