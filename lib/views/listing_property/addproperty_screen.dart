import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/listing_property/add_propertysecond.dart';
import 'package:real_estate/views/listing_property/widgets/build_button.dart';
import 'package:real_estate/views/listing_property/widgets/build_status.dart';
import 'package:real_estate/views/listing_property/widgets/build_textfield.dart';
import 'package:real_estate/views/listing_property/widgets/build_typeofproperty.dart';
import 'package:real_estate/views/listing_property/widgets/toggle_button.dart';
import 'widgets/build_features.dart';

class AddPropertyscreen extends StatelessWidget {
  const AddPropertyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .05);
    AddpropertyController propertyCntr = Get.put(AddpropertyController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Add Property', style: AppTextStyles.mainHeading),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sb * .5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sb * .8,
              ),
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: sb * .5,
              ),
              const Text("Type", style: AppTextStyles.subHeading),
              SizedBox(
                height: sb * .1,
              ),
              buildType(PropertyModel.type, sb, propertyCntr, true),
              SizedBox(height: sb * .8),
              const Text("Property Features", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildCounter(sb, "Bedroom", propertyCntr.bedroomCount),
              SizedBox(
                height: sb * .5,
              ),
              buildCounter(sb, "Bathroom", propertyCntr.bathroomCount),
              SizedBox(
                height: sb * .5,
              ),
              buildCounter(sb, "Balcony", propertyCntr.balconyCount),
              SizedBox(
                height: sb * .5,
              ),
              buildCounter(sb, "Car Parking", propertyCntr.carparkingCount),
              SizedBox(
                height: sb,
              ),
              buildStatus(
                  sb,
                  propertyCntr,
                  PropertyModel.furnishing,
                  "Select one",
                  propertyCntr.selectedFurnishing,
                  propertyCntr.selectFurnishing),
              SizedBox(
                height: sb * .5,
              ),
              buildStatus(
                  sb,
                  propertyCntr,
                  PropertyModel.constructstatus,
                  "Select one",
                  propertyCntr.selectedConstructionStatus,
                  propertyCntr.selectConstructionStatus),
              SizedBox(
                height: sb,
              ),
              Text("Super Builtup area (ft²) ",
                  style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(
                  propertyCntr, propertyCntr.builtupArea, true, 0, ""),
              SizedBox(height: sb),
              Text("Project name", style: AppTextStyles.subHeading),
              SizedBox(height: sb * .1),
              buildTextfield(
                  propertyCntr, propertyCntr.projectName, false, 7, ""),
              SizedBox(height: sb * .5),
              Text("Ad tittle", style: AppTextStyles.subHeading),
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
              SubmitButtontwo(
                  controller: propertyCntr,
                  buttonname: "Next",
                  onPressed: () {
                    Get.to(() => const AddPropertysecond());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
