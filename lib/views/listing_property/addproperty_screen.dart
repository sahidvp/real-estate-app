// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/addproperty_controller.dart';
// import 'package:real_estate/model/propertlisting/property_model.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/media_query.dart';
// import 'package:real_estate/views/listing_property/add_propertysecond.dart';
// import 'package:real_estate/views/listing_property/widgets/build_adimage.dart';
// import 'package:real_estate/views/listing_property/widgets/build_button.dart';
// import 'package:real_estate/views/listing_property/widgets/build_status.dart';
// import 'package:real_estate/views/listing_property/widgets/build_textfield.dart';
// import 'package:real_estate/views/listing_property/widgets/build_typeofproperty.dart';
// import 'package:real_estate/views/listing_property/widgets/toggle_button.dart';
// import 'widgets/build_features.dart';

// class AddPropertyscreen extends StatelessWidget {
//   final bool isLand;
//   const AddPropertyscreen({super.key, required this.isLand});

//   @override
//   Widget build(BuildContext context) {
//     final sb = MediaQueryUtil.getHeightPercentage(context, .05);
//     AddpropertyController propertyCntr = Get.put(AddpropertyController());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text('Add Property', style: AppTextStyles.mainHeading),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: sb * .5),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: sb * .8,
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: sb),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ToggleButton(
//                         text: "Sale",
//                         index: 0,
//                         selectedIndex: propertyCntr.selectedIndex1,
//                         singleselection: true,
//                         cntrl: propertyCntr,
//                       ),
//                     ),
//                     Expanded(
//                       child: ToggleButton(
//                         text: "Rent",
//                         index: 1,
//                         selectedIndex: propertyCntr.selectedIndex1,
//                         singleselection: true,
//                         cntrl: propertyCntr,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: sb * .5,
//               ),
//              const Text("Type", style: AppTextStyles.subHeading),
//               SizedBox(
//                 height: sb * .1,
//               ),
//               buildType(PropertyModel.type, sb, propertyCntr, true),
//               SizedBox(height: sb * .8),
//               const Text("Property Features", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildCounter(sb, "Bedroom", propertyCntr.bedroomCount),
//               SizedBox(
//                 height: sb * .5,
//               ),
//               buildCounter(sb, "Bathroom", propertyCntr.bathroomCount),
//               SizedBox(height: sb * .5),
//               buildCounter(sb, "Car Parking", propertyCntr.carparkingCount),
//               SizedBox(height: sb * .5),
//               buildCounter(sb, "No of floors ", propertyCntr.floorCount),
//               SizedBox(
//                 height: sb,
//               ),
//               buildStatus(
//                   sb,
//                   propertyCntr,
//                   PropertyModel.furnishing,
//                   "Select one",
//                   propertyCntr.selectedFurnishing,
//                   propertyCntr.selectFurnishing),
//               SizedBox(
//                 height: sb * .5,
//               ),
//               buildStatus(
//                   sb,
//                   propertyCntr,
//                   PropertyModel.constructstatus,
//                   "Select one",
//                   propertyCntr.selectedConstructionStatus,
//                   propertyCntr.selectConstructionStatus),
//               SizedBox(height: sb * .5),
//               buildStatus(sb, propertyCntr, PropertyModel.listedby, "",
//                   propertyCntr.selectedlistedby, propertyCntr.selectlistby),
//               SizedBox(
//                 height: sb,
//               ),
//               Text("Super Builtup area (ft²) ",
//                   style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(
//                   propertyCntr, propertyCntr.builtupArea, true, 0, ""),
//               SizedBox(height: sb),
//               Text("Project name", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(
//                   propertyCntr, propertyCntr.projectName, false, 7, ""),
//               SizedBox(height: sb * .5),
//               Text("Ad tittle", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(propertyCntr, propertyCntr.adTittle, false, 7,
//                   "Mention the key features"),
//               SizedBox(height: sb * .5),
//               Text("Description", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(propertyCntr, propertyCntr.description, false, 40,
//                   "Include condition, features and reason for selling"),
//               SizedBox(height: sb * .5),
//               Text("SET A PRICE", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(propertyCntr, propertyCntr.price, true, 0, ""),
//               SizedBox(height: sb * .5),
//               Divider(),
//               SizedBox(
//                 height: sb * .5,
//               ),
//               Text(
//                 "Enviornment / Facilities",
//                 style: AppTextStyles.subHeading,
//               ),
//               SizedBox(height: sb * .1),
//               buildType(PropertyModel.enviornment, sb, propertyCntr, false),
//               AddLocation(),
//               AddImage(),
//               SubmitButtontwo(
//                   controller: propertyCntr,
//                   buttonname: "Next",
//                   onPressed: () {
//                     propertyCntr.location.clear();
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
/////////////////

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/listing_property/add_propertysecond.dart';
import 'package:real_estate/views/listing_property/widgets/build_adimage.dart';
import 'package:real_estate/views/listing_property/widgets/build_button.dart';
import 'package:real_estate/views/listing_property/widgets/build_status.dart';
import 'package:real_estate/views/listing_property/widgets/build_textfield.dart';
import 'package:real_estate/views/listing_property/widgets/build_typeofproperty.dart';
import 'package:real_estate/views/listing_property/widgets/toggle_button.dart';
import 'widgets/build_features.dart';

// class AddPropertyscreen extends StatelessWidget {
//   final bool isLand; // Receive the boolean parameter

//   const AddPropertyscreen({super.key, required this.isLand});

//   @override
//   Widget build(BuildContext context) {
//     final sb = MediaQueryUtil.getHeightPercentage(context, .05);
//     AddpropertyController propertyCntr = Get.put(AddpropertyController());

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text('Add Property', style: AppTextStyles.mainHeading),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: sb * .5),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: sb * .8),

//               // Toggle buttons for Sale/Rent
//               if (isLand)
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: sb),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: ToggleButton(
//                           text: "Sale",
//                           index: 0,
//                           selectedIndex: propertyCntr.selectedIndex1,
//                           singleselection: true,
//                           cntrl: propertyCntr,
//                         ),
//                       ),
//                       Expanded(
//                         child: ToggleButton(
//                           text: "Rent",
//                           index: 1,
//                           selectedIndex: propertyCntr.selectedIndex1,
//                           singleselection: true,
//                           cntrl: propertyCntr,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               SizedBox(height: sb * .5),

//               // Type of property
//               if (!isLand) ...[
//                 const Text("Type", style: AppTextStyles.subHeading),
//                 SizedBox(height: sb * .1),
//                 buildType(PropertyModel.type, sb, propertyCntr, true),
//                 SizedBox(height: sb * .8),
//               ],

//               // Property Features
//               if (!isLand) ...[
//                 const Text("Property Features",
//                     style: AppTextStyles.subHeading),
//                 SizedBox(height: sb * .1),
//                 buildCounter(sb, "Bedroom", propertyCntr.bedroomCount),
//                 SizedBox(height: sb * .5),
//                 buildCounter(sb, "Bathroom", propertyCntr.bathroomCount),
//                 SizedBox(height: sb * .5),
//                 buildCounter(sb, "Car Parking", propertyCntr.carparkingCount),
//                 SizedBox(height: sb * .5),
//                 buildCounter(sb, "No of floors ", propertyCntr.floorCount),
//                 SizedBox(height: sb),
//               ],

//               // Furnishing Status
//               if (!isLand)
//                 buildStatus(
//                   sb,
//                   propertyCntr,
//                   PropertyModel.furnishing,
//                   "Select one",
//                   propertyCntr.selectedFurnishing,
//                   propertyCntr.selectFurnishing,
//                 ),
//               SizedBox(height: sb * .5),

//               // Construction Status
//               if (!isLand)
//                 buildStatus(
//                   sb,
//                   propertyCntr,
//                   PropertyModel.constructstatus,
//                   "Select one",
//                   propertyCntr.selectedConstructionStatus,
//                   propertyCntr.selectConstructionStatus,
//                 ),
//               SizedBox(height: sb * .5),

//               // Listed by status (Keep this one)
//               buildStatus(
//                 sb,
//                 propertyCntr,
//                 PropertyModel.listedby,
//                 "",
//                 propertyCntr.selectedlistedby,
//                 propertyCntr.selectlistby,
//               ),
//               SizedBox(height: sb),

//               // Build-up Area, Project Name, Ad Title, Description, Price
//               Text("Super Builtup area (ft²)", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(
//                   propertyCntr, propertyCntr.builtupArea, true, 0, ""),
//               SizedBox(height: sb),
//               Text("Project name", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(
//                   propertyCntr, propertyCntr.projectName, false, 7, ""),
//               SizedBox(height: sb * .5),
//               Text("Ad title", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(propertyCntr, propertyCntr.adTittle, false, 7,
//                   "Mention the key features"),
//               SizedBox(height: sb * .5),
//               Text("Description", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(propertyCntr, propertyCntr.description, false, 40,
//                   "Include condition, features and reason for selling"),
//               SizedBox(height: sb * .5),
//               Text("SET A PRICE", style: AppTextStyles.subHeading),
//               SizedBox(height: sb * .1),
//               buildTextfield(propertyCntr, propertyCntr.price, true, 0, ""),
//               SizedBox(height: sb * .5),
//               Divider(),
//               SizedBox(height: sb * .5),

//               // Environment / Facilities
//               if (!isLand) ...[
//                 Text("Environment / Facilities",
//                     style: AppTextStyles.subHeading),
//                 SizedBox(height: sb * .1),
//                 buildType(PropertyModel.enviornment, sb, propertyCntr, false),
//               ],

//               AddLocation(),
//               AddImage(),
//               SubmitButtontwo(
//                 controller: propertyCntr,
//                 buttonname: "Next",
//                 onPressed: () {
//                   propertyCntr.location.clear();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////

class AddPropertyscreen extends StatelessWidget {
  final bool isLand; // Receive the boolean parameter

  const AddPropertyscreen({super.key, required this.isLand});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .05);
    AddpropertyController propertyCntr = Get.put(AddpropertyController());
    AuthController cntrl = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.all(10), child: ArrowButton()),
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColors.iconSecondary,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Add Property', style: AppTextStyles.mainHeading),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sb * .5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sb * .8),

              // Toggle buttons for Sale/Rent

              Padding(
                padding: EdgeInsets.symmetric(horizontal: sb),
                child: Row(
                  children: [
                    Expanded(
                      child: ToggleButton(
                        text: "Sale",
                        index: 0,
                        selectedIndex: propertyCntr.selectedIndex1,
                        singleselection: true,
                        cntrl: propertyCntr,
                      ),
                    ),
                    Expanded(
                      child: ToggleButton(
                        text: "Rent",
                        index: 1,
                        selectedIndex: propertyCntr.selectedIndex1,
                        singleselection: true,
                        cntrl: propertyCntr,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sb * .5),

              // Type of property
              if (!isLand) ...[
                const Text("Type", style: AppTextStyles.subHeading),
                SizedBox(height: sb * .1),
                buildType(PropertyModel.type, sb, propertyCntr, true),
                SizedBox(height: sb * .8),
              ],

              // Property Features
              if (!isLand) ...[
                const Text("Property Features",
                    style: AppTextStyles.subHeading),
                SizedBox(height: sb * .1),
                buildCounter(sb, "Bedroom", propertyCntr.bedroomCount),
                SizedBox(height: sb * .5),
                buildCounter(sb, "Bathroom", propertyCntr.bathroomCount),
                SizedBox(height: sb * .5),
                buildCounter(sb, "Car Parking", propertyCntr.carparkingCount),
                SizedBox(height: sb * .5),
                buildCounter(sb, "No of floors ", propertyCntr.floorCount),
                SizedBox(height: sb),
              ],

              // Furnishing Status
              if (!isLand)
                buildStatus(
                  sb,
                  propertyCntr,
                  PropertyModel.furnishing,
                  "furnishing",
                  propertyCntr.selectedFurnishing,
                  propertyCntr.selectFurnishing,
                ),
              SizedBox(height: sb * .5),

              // Construction Status
              if (!isLand)
                buildStatus(
                  sb,
                  propertyCntr,
                  PropertyModel.constructstatus,
                  "construction",
                  propertyCntr.selectedConstructionStatus,
                  propertyCntr.selectConstructionStatus,
                ),
              SizedBox(height: sb * .5),

              // Listed by status (Keep this one)
              buildStatus(
                sb,
                propertyCntr,
                PropertyModel.listedby,
                "listedby",
                propertyCntr.selectedlistedby,
                propertyCntr.selectlistby,
              ),
              SizedBox(height: sb),

              // Build-up Area, Project Name, Ad Title, Description, Price
              Text("Super Builtup area (ft²)", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(
                  propertyCntr, propertyCntr.builtupArea, true, 0, ""),
              SizedBox(height: sb),

              // Breadth and Length (only if isLand is true)
              if (isLand) ...[
                Text("Breadth (ft)", style: AppTextStyles.subHeading),
                SizedBox(height: sb * .1),
                buildTextfield(propertyCntr, propertyCntr.breadth, true, 0, ""),
                SizedBox(height: sb),
                Text("Length (ft)", style: AppTextStyles.subHeading),
                SizedBox(height: sb * .1),
                buildTextfield(propertyCntr, propertyCntr.length, true, 0, ""),
                SizedBox(height: sb),
              ],

              Text("Project name", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(propertyCntr, propertyCntr.projectName, false, 7,
                  "Create a title for your property that will appear in search results"),
              SizedBox(height: sb * .5),
              Text("Title", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(propertyCntr, propertyCntr.adTittle, false, 7,
                  "Mention the key features"),
              SizedBox(height: sb * .5),
              Text("Description", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(propertyCntr, propertyCntr.description, false, 40,
                  "Include condition, features and reason for selling"),
              SizedBox(height: sb * .5),
              Text("SET A PRICE", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(propertyCntr, propertyCntr.price, true, 0, ""),
              SizedBox(height: sb * .5),
              Divider(),
              SizedBox(height: sb * .5),

              // Environment / Facilities
              if (!isLand) ...[
                Text("Environment / Facilities",
                    style: AppTextStyles.subHeading),
                SizedBox(height: sb * .1),
                buildType(PropertyModel.enviornment, sb, propertyCntr, false),
              ],

              AddLocation(),
              AddImage(),

              SubmitButtontwo(
                controller: propertyCntr,
                buttonname: "Next",
                onPressed: () {
                  propertyCntr.addPropertyDetails(
                    category: isLand ? "Land" : propertyCntr.category,
                    transactionType: propertyCntr.type,
                    title: propertyCntr.adTittle.text,
                    description: propertyCntr.description.text,
                    projectname: propertyCntr.projectName.text,
                    price: propertyCntr.price.text,
                    location: propertyCntr.location,
                    imageUrls: propertyCntr.imageUrls,
                    environment: propertyCntr.environment,
                    listedBy: propertyCntr.listedBy,
                    length: propertyCntr.length.text,
                    breadth: propertyCntr.breadth.text,
                    furnishing: propertyCntr.furnishing,
                    constructionStatus: propertyCntr.constructionStatus,
                    carParking: propertyCntr.carparkingCount.toString(),
                    bedrooms: propertyCntr.bedroomCount.toString(),
                    bathrooms: propertyCntr.bathroomCount.toString(),
                    areaftsq: propertyCntr.builtupArea.text,
                    floors: propertyCntr.floorCount.toString(),
                    postedBy: cntrl.fullNameController.text,
                    postedFrom: propertyCntr.postedFrom,
                    userImg: cntrl.imgUrl,
                    propertySaved: propertyCntr.propertySaved,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
