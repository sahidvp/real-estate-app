import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';


import 'package:real_estate/utils/media_query.dart';

import 'package:real_estate/views/property_deatiled_view/widgets/bottom_body.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/silver_appbar.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/silver_list.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/tab_details/tab_details.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/tab_galelry/tab_gallery.dart';

class PropertyDetailsView extends StatelessWidget {
  final dynamic property;
  const PropertyDetailsView({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    AddpropertyController controller = Get.find();
    final screenHeight = MediaQueryUtil.getHeightPercentage(context, 1);
    final screenWidth = MediaQueryUtil.getWidthPercentage(context, 1);
    final sh = screenHeight * .02;
    var sb = SizedBox(height: sh);
    // controller.checkSavedStatus(property.id, property.propertySaved);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            silverAppbar(controller, property.imageUrls[0], property),
            silverList(
              sh,
              sb,
              category: property.category,
              tittle: property.title,
              location:
                  "${property.location["city"]},${property.location["state"]}",
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                      child: tabDetails(screenWidth, screenHeight, property)),
                  SingleChildScrollView(child: tabGallery(property.imageUrls))
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            bottomBody(screenHeight, screenWidth, property.price,property.userId,property ),
      ),
    );
  }
}
