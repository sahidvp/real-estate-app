import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/commonwidgdets/heart_button.dart';
import 'package:real_estate/commonwidgdets/indian_rupee.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';
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
      body: ListView.builder(
          itemCount: controller.favProperties.length,
          itemBuilder: (context, index) {
            final property = controller.favProperties[index];
            return favProperty(property, sh, controller);
          }),
    );
  }
}
