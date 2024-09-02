import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

Obx buildStatus(
    double sb,
    AddpropertyController propertyCntr,
    List<String> status,
    String menuHint,
    Rx<String?> selectedValue,
    void Function(String) onChanged) {
  return Obx(() {
    // Check if `status` is empty to avoid issues
    if (status.isEmpty) {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.fieldcolor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withAlpha(150)),
        ),
        child: Text(
          "No options available",
          style: AppTextStyles.minitext3,
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.fieldcolor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withAlpha(150)),
      ),
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
        icon: SizedBox.shrink(),
        value: selectedValue.value,
        hint: Icon(
          IconsaxPlusLinear.arrow_right_3,
          color: Colors.black,
        ),
        onChanged: (String? newValue) {
          
          
          if (newValue != null) {
            onChanged(newValue);
          }
        },
        items: status.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(value))),
              ),
            ),
          );
        }).toList(),
      ),
    );
  });
}
