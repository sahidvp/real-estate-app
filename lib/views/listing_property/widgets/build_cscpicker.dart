import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

CSCPicker buildCscpicker(AddpropertyController propertyCntr) {
  return CSCPicker(
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
      propertyCntr.update();
    },
  );
}
