import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/property_view/filer_section.dart/filter_page.dart';

// InkWell buildFilter(sb) {
//   return InkWell(
//     onTap: () => Get.to(() => FilterPage()),
//     child: Container(
//       width: sb * .6,
//       height: sb * .6,
//       decoration: BoxDecoration(
//         boxShadow: [AppDecoration.boxShadow],
//         color: AppColors.primary,
//         // border: ,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//           child: SvgPicture.asset(
//         Imagepath.searchfilter,
//         width: sb * .2,
//       )),
//     ),
//   );
// }

InkWell buildFilter(double sb, filterCount) {
  return InkWell(
    onTap: () => Get.to(() => FilterPage()),
    child: Stack(
      children: [
        Container(
          width: sb * .6,
          height: sb * .6,
          decoration: BoxDecoration(
            boxShadow: [AppDecoration.boxShadow],
            border: filterCount > 0 ? Border.all(color: Colors.black) : null,
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: SvgPicture.asset(
              Imagepath.searchfilter,
              width: sb * .2,
            ),
          ),
        ),
        // Display the badge if there are active filters
        if (filterCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: CircleAvatar(
              radius: 10, // Badge size
              backgroundColor: Colors.black, // Badge color
              child: Text(
                filterCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    ),
  );
}
