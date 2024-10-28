
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/utils/colors.dart';

Container featureCount(double sw, String svgicon, String feature, featCount) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppDecoration.boxShadow],
        borderRadius: BorderRadius.circular(10)),
    width: sw * .28,
    height: sw * .2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgicon,
          width: sw * .06,
        ),
        Text(
          featCount,
          style: AppTextStyles.featurecount,
        ),
        Flexible(
            child: Text(
          feature,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ))
      ],
    ),
  );
}