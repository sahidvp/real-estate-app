import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

Container buildFilter(sb) {
  return Container(
    width: sb * .6,
    height: sb * .6,
    decoration: BoxDecoration(
      boxShadow: [AppDecoration.boxShadow],
      color: AppColors.primary,
      // border: ,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
        child: SvgPicture.asset(
      Imagepath.searchfilter,
      width: sb * .2,
    )),
  );
}
