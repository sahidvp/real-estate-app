import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/bottomnav_controller.dart';
import 'package:real_estate/utils/colors.dart';

Row filterButtons(AddpropertyController controller,
    TextEditingController minamount, TextEditingController maxamount) {
  BottomNavController bCntrl = Get.put(BottomNavController());
  return Row(
    children: [
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[300],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          onPressed: () {
            controller.filterClear();
            controller.fetchProperties();
            controller.updateFilterCount();

            // Reset filter action
          },
          child: const Text(
            "Reset Filter",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          onPressed: () {
            if (minamount.text.isNotEmpty && maxamount.text.isNotEmpty) {
              controller.startingRange = int.parse(minamount.text);
              controller.endingRange = int.parse(maxamount.text);
            }

            controller.fetchProperties();
            controller.updateFilterCount();
            bCntrl.selectedIndex.value = 2;
            Get.back();
          },
          child: const Text(
            "Apply",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}
