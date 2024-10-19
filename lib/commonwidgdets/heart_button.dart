  import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/homepage_controller.dart';
import 'package:real_estate/utils/colors.dart';

Obx heartButton(HomeBodyController controller) {
    return Obx(() => GestureDetector(
                              child: Icon(
                                controller.isFavorite(0)
                                    ? IconsaxPlusBold.heart
                                    : IconsaxPlusLinear.heart,
                                color: AppColors.primary,
                                size: 20,
                              ),
                              onTap: () => controller.toggleFavorite(0),
                            ));
  }