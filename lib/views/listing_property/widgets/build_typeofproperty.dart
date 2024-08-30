import 'package:flutter/material.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/views/listing_property/widgets/toggle_button.dart';

Container buildType(
    List<String> list, double sb, AddpropertyController propertyCntr) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: sb * .5),
    child: Wrap(
      spacing: 5.0, // Horizontal spacing between children
      runSpacing: 8.0, // Vertical spacing between rows
      children: List.generate(list.length, (index) {
        return SizedBox(
          width: sb * 3.5, // Specify the width directly
          child: ToggleButton(
            text: list[index],
            index: index,
            selectedIndex: propertyCntr.selectedIndex2,
          ),
        );
      }),
    ),
  );
}
