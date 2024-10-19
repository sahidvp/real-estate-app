// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/commonwidgdets/backbutton.dart';
// import 'package:real_estate/commonwidgdets/heart_button.dart';
// import 'package:real_estate/controller/homepage_controller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/imagespath.dart';
// import 'package:real_estate/utils/media_query.dart';

// class ProperyDetails extends StatelessWidget {
//   const ProperyDetails({super.key});

//   @override
//   Widget build(BuildContext context) {
//     HomeBodyController hController = Get.put(HomeBodyController());
//     final screenHeight = MediaQueryUtil.getHeightPercentage(context, 1);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//         Stack(
//           children: [
//             Container(
//                 height: screenHeight * .4,
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                 ),
//                 child: Image.asset(
//                   Imagepath.homedemo,
//                   fit: BoxFit.fill,
//                 )),
//             Padding(
//               padding: EdgeInsets.only(top: 20, left: 15, right: 15),
//               child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ArrowButton(),
//                     Container(
//                         padding: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                             color: AppColors.fieldcolor,
//                             shape: BoxShape.circle),
//                         child: heartButton(hController))
//                   ]),
//             )
//           ],
//         ),
//       ]),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/commonwidgdets/backbutton.dart';
// import 'package:real_estate/commonwidgdets/category_tag.dart';
// import 'package:real_estate/commonwidgdets/heart_button.dart';
// import 'package:real_estate/controller/homepage_controller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/imagespath.dart';
// import 'package:real_estate/utils/media_query.dart';

// class PropertyDetailsView extends StatelessWidget {
//   const PropertyDetailsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     HomeBodyController hController = Get.put(HomeBodyController());
//     final screenHeight = MediaQueryUtil.getHeightPercentage(context, 1);
//     final screenwidth = MediaQueryUtil.getWidthPercentage(context, 1);
//     final sh = screenHeight * .02;
//     var sb = SizedBox(
//       height: sh,
//     );
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             surfaceTintColor: Colors.transparent,
//             leading: ArrowButton(),
//             actions: [
//               Container(
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                       color: AppColors.fieldcolor, shape: BoxShape.circle),
//                   child: heartButton(hController))
//             ],
//             backgroundColor: Colors.transparent,
//             elevation: 0, // No shadow
//             expandedHeight: 250.0, // Height of the app bar when expanded
//             floating: true,
//             pinned:
//                 true, // Keeps the app bar pinned at the top after collapsing
//             flexibleSpace: FlexibleSpaceBar(
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image.asset(
//                     Imagepath.homedemo, // Your property image
//                     fit: BoxFit.cover, // Make the image fill the space
//                   ),
//                   Container(
//                     color: Colors.black.withOpacity(
//                         0.3), // Dark overlay for better text visibility
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   color: Colors.white,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: sh),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         sb,
//                         categoryTag("Appartment"),
//                         Text(
//                           "Woodland Apartment",
//                           style: AppTextStyles.propertyTitle,
//                         ),
//                         Text(
//                           "kozhikode kerala india",
//                           style: AppTextStyles.locationtext,
//                         ),
//                         Container(
//                           height: 800,
//                           color: Colors.amber,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/homepage_controller.dart';
import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/utils/media_query.dart';

import 'package:real_estate/views/property_deatiled_view/widgets/bottom_body.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/silver_appbar.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/silver_list.dart';
import 'package:real_estate/views/property_deatiled_view/widgets/tab_details.dart';

class PropertyDetailsView extends StatelessWidget {
  final dynamic property;
  const PropertyDetailsView({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    HomeBodyController hController = Get.put(HomeBodyController());
    final screenHeight = MediaQueryUtil.getHeightPercentage(context, 1);
    final screenWidth = MediaQueryUtil.getWidthPercentage(context, 1);
    final sh = screenHeight * .02;
    var sb = SizedBox(height: sh);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            silverAppbar(hController, property.imageUrls[0]),
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
                  tabGallery()
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            bottomBody(screenHeight, screenWidth, property.price),
      ),
    );
  }

  Container tabGallery() {
    return Container(
      height: 200,
    );
  }
}
