import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/home_body.dart';

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
          title: Text("Filter"),
          leading: ArrowButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price Range Slider
            Text(
              "Price Range",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Slider(
              value: 20000,
              min: 0,
              max: 100000,
              activeColor: AppColors.primary,
              inactiveColor: Colors.grey,
              onChanged: (value) {},
            ),
            SizedBox(height: 10),

            Text(
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
            SizedBox(height: 20),

            Text(
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
            SizedBox(height: 20),

            Text(
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
            Spacer(),

            // Reset and Apply Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      // Reset filter action
                    },
                    child: Text(
                      "Reset Filter",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {
                      // Apply filter action
                    },
                    child: Text(
                      "Apply",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget for the toggle buttons (Rent, Sale, All, etc.)
  Widget _buildToggleButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          // Toggle button action
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300], // Can change color on selection
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
