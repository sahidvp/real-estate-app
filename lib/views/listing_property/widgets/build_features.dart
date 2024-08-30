import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/utils/colors.dart';

Container buildCounter(double sb, String feature, RxInt counter) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black.withAlpha(150)),
      borderRadius: BorderRadius.circular(15),
      color: AppColors.fieldcolor,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: sb * .5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            feature,
            style: AppTextStyles.minitext3,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (counter.value > 0) {
                      counter.value--; // Decrease counter
                    }
                  },
                  icon: Icon(
                    IconsaxPlusBold.minus_square,
                    color: AppColors.unselectitem,
                  )),
              Obx(() => Text(
                    counter.value
                        .toString(), // Observe and display the counter value
                    style: AppTextStyles.minitext3,
                  )),
              IconButton(
                  onPressed: () {
                    counter.value++;
                  },
                  icon: Icon(
                    IconsaxPlusBold.add_square,
                    color: AppColors.unselectitem,
                  ))
            ],
          )
        ],
      ),
    ),
  );
}
