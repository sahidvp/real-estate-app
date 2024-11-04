import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/addproperty_controller.dart';

import 'package:real_estate/utils/media_query.dart';

import 'package:real_estate/views/userprofile/widgets/app_bar.dart';

import 'widget/property_box.dart';

class FavouriteProperty extends StatelessWidget {
  const FavouriteProperty({super.key});

  @override
  Widget build(BuildContext context) {
    AddpropertyController controller = Get.find();
    final sh = MediaQueryUtil.getHeightPercentage(context, .10);
    return Scaffold(
      appBar: appBar("Favourites"),
      body: Obx(() {
        if (controller.favProperties.isEmpty) {
          return const Center(
            child: Text(
              "No favourite properies",
              style:  TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.favProperties.length,
            itemBuilder: (context, index) {
              final property = controller.favProperties[index];
              return favProperty(property, sh, controller);
            },
          );
        }
      }),
    );
  }
}
