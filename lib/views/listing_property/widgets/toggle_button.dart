import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

class ToggleButton extends StatelessWidget {
  final String text;
  final int index;
  final RxInt selectedIndex;
  final bool singleselection;
  final AddpropertyController cntrl;

  const ToggleButton({
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.singleselection,
    required this.cntrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          singleselection ? singletoggle() : cntrl.toggleSelection(index);
          if (singleselection) {
            if (text == "Sale" || text == "Rent") {
              cntrl.type = text;
            } else {
              cntrl.category = text;
            }
          }
        },
        child: Obx(
          () => Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withAlpha(150)),
              color: singleselection
                  ? selectedIndex.value == index
                      ? AppColors.primary
                      : AppColors.fieldcolor
                  : cntrl.selectedIndices.contains(index)
                      ? AppColors.primary
                      : AppColors.fieldcolor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: singleselection
                ? selectedIndex.value == index
                    ? toggleRow()
                    : toggleCentere()
                : cntrl.selectedIndices.contains(index)
                    ? toggleRow()
                    : toggleCentere(),
          ),
        ),
      ),
    );
  }

  Center toggleCentere() {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row toggleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconsaxPlusBold.tick_circle,
          color: Colors.black,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  singletoggle() {
    if (selectedIndex.value == index) {
      selectedIndex.value = 100;

      return;
    }
    selectedIndex.value = index;
  }
}
