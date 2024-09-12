import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/bottomnav_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/property_view/all_property.dart';

Container buildHomesearch(sb) {
  BottomNavController cntrl = Get.put(BottomNavController());

  return Container(
    width: sb * 3.5,
    height: sb * .7,
    decoration: BoxDecoration(
        boxShadow: [AppDecoration.boxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      onTap: () {
        cntrl.selectedIndex.value = 2;
      },
      decoration: InputDecoration(
          hintText: "Search by category",
          hintStyle: TextStyle(
              color: AppColors.iconSecondary,
              fontWeight: FontWeight.w400,
              fontSize: 15),
          prefixIcon: Icon(
            IconsaxPlusLinear.search_normal_1,
            color: AppColors.iconSecondary,
          ),
          contentPadding: EdgeInsets.only(top: 15),
          border: InputBorder.none),
    ),
  );
}
