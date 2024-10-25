import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/commonwidgdets/heart_button.dart';
import 'package:real_estate/commonwidgdets/indian_rupee.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/controller/homepage_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart'; // Ensure you have this package

class CarousalSlider extends StatelessWidget {
  final double sb;
  final List properties; // Accept properties

  const CarousalSlider({super.key, required this.sb, required this.properties});

  @override
  Widget build(BuildContext context) {
    final HomeBodyController controller = Get.put(HomeBodyController());
    AddpropertyController pCntrl = Get.find();

    return Container(
      height: sb * 3,
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          viewportFraction: .7,
          autoPlayCurve: Curves.easeInBack,
        ),
        items: properties.map((property) {
        //  pCntrl.checkSavedStatus(property.id, property.propertySaved);
          return GestureDetector(
            onTap: () => Get.to(() => PropertyDetailsView(
                  property: property,
                )),
            child: Container(
              width: sb * 3.5,
              height: sb * 3.5,
              decoration: BoxDecoration(
                boxShadow: [AppDecoration.boxShadow],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        property.imageUrls[0], // Assuming imageUrls is a list
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        height: sb * 1.5,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                              child:
                                  CircularProgressIndicator()); // Show loading indicator
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: sb * .08),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "${property.title}",
                      style: AppTextStyles.propertyTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      indianRupee(
                          property.price), // Assuming price is a property
                      style: AppTextStyles.priceText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: heartButton(controller: pCntrl, propertyId: property.id))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
