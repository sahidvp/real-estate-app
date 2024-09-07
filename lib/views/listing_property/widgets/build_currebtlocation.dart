 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/google_map/get_currentlocation.dart';
import 'package:real_estate/utils/colors.dart';

GestureDetector buildCurrentlocation(AddpropertyController propertyCntr, double sb) {
    return GestureDetector(
          onTap: ()  {
            Get.to(()=>const GetCurrentlocationScreen(isHomeScreen: false,));
           
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
                "choose location",
                style: AppTextStyles.subHeading,
              ),
            ),
          ),
        );
  }