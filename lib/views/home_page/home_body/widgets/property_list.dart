import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';


class PropertyList extends StatelessWidget {
  const PropertyList({super.key, required this.sb, required this.properties});

  final double sb;
  final List properties;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddpropertyController>(
      init: AddpropertyController(),
      builder: (controller) {
        controller.fetchNearbyProperties(controller.location["city"]);
        return controller.location["city"] == ""
            ? Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.location_off,
                      color: AppColors.primary,
                      size: sb,
                    ),
                    Text(
                      "Choose location",
                      style: AppTextStyles.headline1,
                    )
                  ],
                ),
              )
            : properties.isEmpty
                ? Center(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: sb),
                        child: Text(
                          "No properties near you",
                          style: AppTextStyles.tokenText,
                        )),
                  )
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        properties.length, // Show all properties from the list
                    itemBuilder: (context, i) {
                      final property = properties[i];
                      return propertyTag(
                          sb, property); // Pass each property to the widget
                    },
                  );
      },
    );
  }
}
