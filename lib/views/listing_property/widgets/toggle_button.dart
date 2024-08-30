import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/utils/colors.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final int index;
  final RxInt selectedIndex;

  const ToggleButton({
    required this.text,
    required this.index,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (selectedIndex.value == index) {
            selectedIndex.value = 100;
            return;
          }
          selectedIndex.value = index; // Select the button by index
        },
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withAlpha(150)),
              color: selectedIndex.value == index
                  ? AppColors.primary
                  : AppColors.fieldcolor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: selectedIndex.value == index
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconsaxPlusBold.tick_circle,
                        color: Colors.black,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          color: selectedIndex.value == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: selectedIndex.value == index
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
