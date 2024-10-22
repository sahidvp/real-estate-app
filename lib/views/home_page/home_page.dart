import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for state management
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/home_body.dart';
import 'home_body/widgets/carousal_slider.dart';
import 'home_header/home_header.dart';
import 'home_body/widgets/property_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //static const List category = ["All", "HOUSE", "APARTMENT", "VILLA", "LAND"];

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .1);
    final AddpropertyController controller =
        Get.put(AddpropertyController()); // Instantiate the controller

    // Call fetchProperties when the widget builds
    // controller.fetchProperties();
    // controller.fetchRecentProperties();
    // controller.fetchNearbyProperties(userCity);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sb * .5),
          HomeHeader(sb: sb),
          SizedBox(height: sb * .2),
           // HomeBodyone(sb: sb, category: category),
          SizedBox(height: sb * .2),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pass the properties to CarousalSlider
                  Obx(() {
                    // Observe properties
                    if (controller.isLoading.value) {
                      return const Center(
                          child:
                              CircularProgressIndicator()); // Loading indicator
                    }
                    return CarousalSlider(
                        sb: sb, properties: controller.recentProperties);
                  }),
                  textNearYou(),

                  Obx(() {
                    // Observe properties
                    if (controller.isLoading.value) {
                      return const Center(
                          child: SizedBox.shrink()); // Loading indicator
                    }
                    return PropertyList(
                        sb: sb,
                        properties:
                            controller.nearbyProperties); // Pass properties
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding textNearYou() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        "Near You",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
