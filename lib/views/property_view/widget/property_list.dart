// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/addproperty_controller.dart';
// import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';
// import 'package:real_estate/views/listing_property/widgets/build_currebtlocation.dart';

// class PropertyList extends StatelessWidget {
//   const PropertyList({super.key, required this.sb, required this.properties});

//   final double sb;
//   final List properties;

//   @override
//   Widget build(BuildContext context) {
//     AddpropertyController cntrl = Get.put(AddpropertyController());
//     return
//          ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: properties.length, // Show all properties from the list
//             itemBuilder: (context, i) {
//               final property = properties[i];
//               return propertyTag(
//                   sb, property); // Pass each property to the widget
//             },
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_location.dart';
import 'package:real_estate/views/listing_property/widgets/build_currebtlocation.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';

class PropertyListTwo extends StatelessWidget {
  const PropertyListTwo(
      {super.key, required this.sb, required this.properties});

  final double sb;
  final List properties;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddpropertyController>(
      init: AddpropertyController(),
      builder: (controller) {
        return controller.isLoading.value
            ? CircularProgressIndicator()
            : properties.isEmpty
                ? Center(
                    child: Text(
                      "No Results ",
                      style: AppTextStyles.headline1,
                    ),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.filteredProperties
                        .length, // Show all properties from the list
                    itemBuilder: (context, i) {
                      final property = controller.filteredProperties[i];
                      return propertyTag(
                          sb, property); // Pass each property to the widget
                    },
                  );
      },
    );
  }
}
