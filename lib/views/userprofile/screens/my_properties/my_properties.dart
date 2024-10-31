

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';

import 'widgets/edit_remove.dart';

class MyProperties extends StatelessWidget {
  const MyProperties({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQueryUtil.getWidthPercentage(context, 1);
    AddpropertyController controller = Get.find();
    return Scaffold(
      backgroundColor: AppColors.fieldcolor,
      appBar: appBar("My properties"),
      body: Obx(() {
        if (controller.myProperties.isEmpty) {
          return Center(
            child: Text(
              "No properties added yet",
              style: AppTextStyles.tokenText,
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.myProperties.length,
            itemBuilder: (context, index) {
              final property = controller.myProperties[index];
              return Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () =>
                      Get.to(() => PropertyDetailsView(property: property)),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      boxShadow: [AppDecoration.boxShadow],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(sw * .08),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            property.imageUrls[0],
                            width: sw * .8,
                            height: sw * .6,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Text(
                          property.title,
                          style: AppTextStyles.propertyTitle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            editRemove(sw, "Edit", property),
                            editRemove(sw, "Remove", property),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
