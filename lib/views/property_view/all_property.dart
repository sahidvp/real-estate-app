import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/home_body.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_filter.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_homesearch.dart';
import 'package:real_estate/views/property_view/widget/property_list.dart';

import '../home_page/home_body/widgets/property_list.dart';

class AllProperty extends StatelessWidget {
  const AllProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddpropertyController());
    final sb = MediaQueryUtil.getHeightPercentage(context, .1);
    final sw = MediaQueryUtil.getWidthPercentage(context, .1);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            SizedBox(
              height: sb,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [buildHomesearch(sb, controller), buildFilter(sb)],
            ),
            SizedBox(
              height: sb * .2,
            ),
            HomeBodyone(sb: sb, category: PropertyModel.category),
            Obx(() {
              // Observe properties
              if (controller.isLoading.value) {
                return const Center(
                    child: SizedBox.shrink()); // Loading indicator
              }
              return PropertyListTwo(
                  sb: sb,
                  properties: controller.filteredProperties); // Pass properties
            }),
          ],
        ),
      ),
    );
  }
}
