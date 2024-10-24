import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/home_body.dart';

import 'widget/filter_buttons.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddpropertyController controller = Get.put(AddpropertyController());
    final sb = MediaQueryUtil.getHeightPercentage(context, .10);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.fieldcolor,
          centerTitle: true,
          title: const Text("Filter"),
          leading: const ArrowButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price Range Slider
            const Text(
              "Price Range",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                priceRange(sb, controller.minAmount, "min"),
                priceRange(sb, controller.maxAmount, "max")
              ],
            ),

            const Text(
              "Type",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            HomeBodyone(
                sb: sb,
                category: PropertyModel.typeFilter,
                selectedIndex: controller.typeFilter,
                onSelected: (index) {
                  controller.typeFilter.value = index;
                }),

            const Text(
              "Listed by",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            HomeBodyone(
                sb: sb,
                category: PropertyModel.listedbyFilter,
                selectedIndex: controller.listedbyFilter,
                onSelected: (index) {
                  controller.listedbyFilter.value = index;
                }),
            const SizedBox(height: 20),

            const Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            HomeBodyone(
                sb: sb,
                category: PropertyModel.categoryFilter,
                selectedIndex: controller.categoryFilter,
                onSelected: (index) {
                  controller.categoryFilter.value = index;
                }),
            const Spacer(),

            // Reset and Apply Buttons
            // filterButtons(controller, minAmount, maxAmount),
          ],
        ),
      ),
      bottomNavigationBar:
          filterButtons(controller, controller.minAmount, controller.maxAmount),
    );
  }

  SizedBox priceRange(
      double sb, TextEditingController controller, String label) {
    return SizedBox(
      width: sb * 1.5,
      height: sb * .7,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration:
            InputDecoration(labelText: label, border: OutlineInputBorder()),
      ),
    );
  }
}
