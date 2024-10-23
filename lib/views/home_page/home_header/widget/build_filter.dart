import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/property_view/filer_section.dart/filter_page.dart';

InkWell buildFilter(sb) {
  return InkWell(
    onTap: () =>Get.to(()=>FilterPage()) ,
    child: Container(
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
    ),
  );
}
