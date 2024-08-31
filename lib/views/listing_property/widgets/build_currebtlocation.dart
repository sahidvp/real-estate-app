 import 'package:flutter/material.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

GestureDetector buildCurrentlocation(AddpropertyController propertyCntr, double sb) {
    return GestureDetector(
          onTap: () async {
            await propertyCntr.getUserLocation();
           
          },
          child: Container(
            width: double.infinity,
            height: sb,
            decoration: BoxDecoration(
                color: AppColors.fieldcolor,
                border: Border.all(color: Colors.black.withAlpha(150)),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                "use current location",
                style: AppTextStyles.subHeading,
              ),
            ),
          ),
        );
  }