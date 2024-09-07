// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:real_estate/controller/map_controller.dart';
// import 'package:real_estate/model/google_map/get_currentlocation.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/imagespath.dart';

// GestureDetector buildLocation(sb, MapController cntrl) {
//   return GestureDetector(
//     onTap: () => Get.to(GetCurrentlocationScreen()),
//     child: Container(
//       height: sb * .7,
//       //  width: ,
//       decoration: BoxDecoration(
//           boxShadow: [AppDecoration.boxShadow],
//           color: Colors.white,
//           border: Border.all(color: Colors.grey.withOpacity(.5)),
//           borderRadius: BorderRadius.circular(sb)),
//       child: Row(
//         children: [
//           SizedBox(
//             width: sb * .2,
//           ),
//           SvgPicture.asset(
//             Imagepath.gpsicon,
//             width: sb * .3,
//           ),
//           Text(
//             cntrl.chooselocation,
//             style: AppTextStyles.hompagebodyText,
//           ),
//           Icon(
//             IconsaxPlusBold.arrow_down,
//             color: AppColors.textPrimary,
//             size: 15,
//           ),
//           SizedBox(
//             width: sb * .2,
//           )
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/map_controller.dart';
import 'package:real_estate/model/google_map/get_currentlocation.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

GestureDetector buildLocation(sb, MapController cntrl) {
  return GestureDetector(
    onTap: () => Get.to(()=>const GetCurrentlocationScreen()),
    child: Container(
      height: sb * .7,
      decoration: BoxDecoration(
          boxShadow: [AppDecoration.boxShadow],
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(.5)),
          borderRadius: BorderRadius.circular(sb)),
      child: Row(
        children: [
          SizedBox(
            width: sb * .2,
          ),
          SvgPicture.asset(
            Imagepath.gpsicon,
            width: sb * .3,
          ),
          // Use Obx to make the Text widget reactive to changes in chooselocation
          Obx(() => Text(
                cntrl.chooselocation.value, // Using the reactive variable
                style: AppTextStyles.hompagebodyText,
              )),
          Icon(
            IconsaxPlusBold.arrow_down,
            color: AppColors.textPrimary,
            size: 15,
          ),
          SizedBox(
            width: sb * .2,
          )
        ],
      ),
    ),
  );
}
