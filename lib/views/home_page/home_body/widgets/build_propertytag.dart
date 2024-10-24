import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/commonwidgdets/category_tag.dart';
import 'package:real_estate/commonwidgdets/indian_rupee.dart';
import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/views/property_deatiled_view/propery_details.dart';

GestureDetector propertyTag(double sb, dynamic property) {
  return GestureDetector(
    onTap: () {
      Get.to(() => PropertyDetailsView(property: property));
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [AppDecoration.boxShadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: sb,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                property.imageUrls[0], // Display the property image
                height: sb,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                      child:
                          CircularProgressIndicator()); // Show loading indicator
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(property.title, style: AppTextStyles.propertyText),
                Row(
                  children: [
                    Icon(
                      IconsaxPlusBold.location,
                      color: Color(0xFFB9B9B9),
                      size: 15,
                    ),
                    Text(
                      "${property.location["city"]},${property.location["state"]}",
                      style: AppTextStyles.propertyLocation,
                    )
                  ],
                ),
                Text(
                  indianRupee(property.price),
                  style: AppTextStyles.priceText,
                ),
                categoryTag(property.category),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
