import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/Loginpage/loginwithmobile/loginwithmobile.dart';

class Iconcontainer extends StatelessWidget {
  final String imageicon;
  final bool isgoogle;

  const Iconcontainer(
      {super.key, required this.imageicon, required this.isgoogle});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.put(AuthController());
    final H = MediaQueryUtil.getHeightPercentage(context, .045);
    final W = MediaQueryUtil.getHeightPercentage(context, .03);
    return Container(
      width: MediaQueryUtil.getWidthPercentage(context, .35),
      height: MediaQueryUtil.getHeightPercentage(context, .07),
      decoration: BoxDecoration(
        color: AppColors.fieldcolor, // Set your desired background color
        borderRadius:
            BorderRadius.circular(20), // Adjust the radius for curvature
      ),
      child: InkWell(
        onTap: () {
          isgoogle ? controller.signInWithGoogle() : Get.to(()=> OtpScreen());
        },
        borderRadius: BorderRadius.circular(15),
        child: Center(
            child: SvgPicture.asset(
          imageicon,
          height: H,
          width: W,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
