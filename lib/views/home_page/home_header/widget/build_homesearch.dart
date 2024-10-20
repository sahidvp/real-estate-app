// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:real_estate/controller/bottomnav_controller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/views/property_view/all_property.dart';

// Container buildHomesearch(sb) {
//   BottomNavController cntrl = Get.put(BottomNavController());

//   return Container(
//     width: sb * 3.5,
//     height: sb * .7,
//     decoration: BoxDecoration(
//         boxShadow: [AppDecoration.boxShadow],
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15)),
//     child: TextFormField(
//       autofocus: cntrl.selectedIndex.value == 2 ? true : false,
//       onTap: () {
//         cntrl.selectedIndex.value = 2;
//       },
//       decoration: InputDecoration(
//           hintText: "Search by category",
//           hintStyle: TextStyle(
//               color: AppColors.iconSecondary,
//               fontWeight: FontWeight.w400,
//               fontSize: 15),
//           prefixIcon: Icon(
//             IconsaxPlusLinear.search_normal_1,
//             color: AppColors.iconSecondary,
//           ),
//           contentPadding: EdgeInsets.only(top: 15),
//           border: InputBorder.none),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/bottomnav_controller.dart';

import 'package:real_estate/utils/colors.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

Container buildHomesearch(double sb, AddpropertyController propertyController) {
  BottomNavController cntrl = Get.put(BottomNavController());
  TextEditingController searchController = TextEditingController();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    searchController.clear();
    propertyController
        .filterProperties(''); // Reset the filtered properties list
  });

  return Container(
    width: sb * 3.5,
    height: sb * .7,
    decoration: BoxDecoration(
      boxShadow: [AppDecoration.boxShadow],
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: TextFormField(
      controller: searchController,
      onChanged: (value) {
        // Filter the property list based on the search input
        propertyController.filterProperties(value);
      },
      // autofocus: cntrl.selectedIndex.value == 2 ? true : false,
      onTap: () {
        cntrl.selectedIndex.value = 2;
      },
      decoration: InputDecoration(
        hintText: "Search properties",
        hintStyle: TextStyle(
          color: AppColors.iconSecondary,
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        prefixIcon: Icon(
          IconsaxPlusLinear.search_normal_1,
          color: AppColors.iconSecondary,
        ),
        contentPadding: EdgeInsets.only(top: 15),
        border: InputBorder.none,
      ),
    ),
  );
}
