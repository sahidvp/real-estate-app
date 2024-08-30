import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/listing_property/widgets/build_typeofproperty.dart';

class AddPropertysecond extends StatelessWidget {
  const AddPropertysecond({super.key});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .05);
    AddpropertyController propertyCntr = Get.put(AddpropertyController());
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: EdgeInsets.only(left: 15), child: const ArrowButton()),
        backgroundColor: AppColors.fieldcolor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: sb * .5,
              ),
              Text(
                "Enviornment / Facilities",
                style: AppTextStyles.subHeading,
              ),
              SizedBox(height: sb * .1),
              buildType(PropertyModel.enviornment, sb, propertyCntr, false),
              SizedBox(height: sb * .5),
              Divider(),
              SizedBox(height: sb * .5),
              CSCPicker(
                searchBarRadius: 25,
                dropdownDialogRadius: 25,
                dropdownDecoration: BoxDecoration(
                  color: AppColors.fieldcolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledDropdownDecoration: BoxDecoration(
                  color: AppColors.fieldcolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                //disableCountry: true,
                flagState: CountryFlag.ENABLE,

                countryFilter: const [CscCountry.India],
                countryDropdownLabel: "Select country",
                stateDropdownLabel: "Select state",
                cityDropdownLabel: "Select city",
                selectedItemStyle: AppTextStyles.subHeading,
                onCountryChanged: (value) {
                  propertyCntr.location['country'] = value.toString();
                },
                onStateChanged: (value) {
                  propertyCntr.location['state'] = value.toString();
                },
                onCityChanged: (value) {
                  propertyCntr.location['city'] = value.toString();
                },
              ),
              SizedBox(height: sb * .5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  style: AppTextStyles.subHeading,
                ),
              ),
              SizedBox(height: sb * .5),
              GestureDetector(
                onTap: () async {
                  
                  await propertyCntr.getUserLocation();
                  
                },
                child: Container(
                  width: double.infinity,
                  height: sb,
                  decoration: BoxDecoration(
                      color: AppColors.fieldcolor,
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      "use current location",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
