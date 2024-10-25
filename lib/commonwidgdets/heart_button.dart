// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:real_estate/controller/addproperty_controller.dart';
// import 'package:real_estate/controller/firbase/firebase_constant.dart';
// import 'package:real_estate/utils/colors.dart';

// Obx heartButton(
//     {required AddpropertyController controller,
//     required prop,
//     required RxBool isSaved}) {
//   return Obx(
//     () => GestureDetector(
//       child: Icon(
//         isSaved.value ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart,
//         color: AppColors.primary,
//         size: 30,
//       ),
//       onTap: () async {
//         if (isSaved.value) {
//           await controller.savedProperties(prop.id, false);
//           isSaved.value = false;
//         } else {
//           await controller.savedProperties(prop.id, true);
//           isSaved.value = true;
//         }
//       },
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:real_estate/controller/addproperty_controller.dart';
// import 'package:real_estate/controller/firbase/firebase_constant.dart';
// import 'package:real_estate/utils/colors.dart';

// Widget heartButton({
//   required AddpropertyController controller,
//   required prop,
//   required isSaved,
// }) {
//   return GetBuilder<AddpropertyController>(
//     init: controller,
//     builder: (controller) {
//       return GestureDetector(
//         child: Icon(
//           isSaved ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart,
//           color: AppColors.primary,
//           size: 30,
//         ),
//         onTap: () async {
//           if (isSaved) {
//             await controller.savedProperties(prop.id, false);
//             isSaved = false;
//           } else {
//             await controller.savedProperties(prop.id, true);
//             isSaved = true;
//           }
//           // Call update to refresh the GetBuilder
//         },
//       );
//     },
//   );
// }


import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

Widget heartButton({
  required AddpropertyController controller,
  required String propertyId,
}) {
  return Obx(() {
    bool isSaved = controller.savedStatus[propertyId] ?? false;

    return GestureDetector(
      child: Icon(
        isSaved ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart,
        color: AppColors.primary,
        size: 30,
      ),
      onTap: () async {
        await controller.savedProperties(propertyId, !isSaved);
      },
    );
  });
}
