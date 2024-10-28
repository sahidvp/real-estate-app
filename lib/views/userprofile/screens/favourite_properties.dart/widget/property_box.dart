 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/heart_button.dart';
import 'package:real_estate/commonwidgdets/indian_rupee.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';

Padding favProperty(property, double sh, AddpropertyController controller) {
    return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: ()=> Get.to(()=> PropertyDetailsView(property: property)),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.fieldcolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        property.imageUrls[0], // Display the property image
                        height: sh,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child:
                                  CircularProgressIndicator()); // Show loading indicator
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          indianRupee(property.price),
                          style: AppTextStyles.priceText,
                        ),
                        Text(
                          property.title,
                          style: AppTextStyles.propertyText,
                        )
                      ],
                    ),
                    heartButton(controller: controller, propertyId: property.id)
                  ],
                ),
              ),
            ),
          );
  }