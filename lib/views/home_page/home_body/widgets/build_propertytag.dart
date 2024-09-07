import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

Container propertyTag(sb) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    width: double.infinity,
    decoration: BoxDecoration(
        boxShadow: [AppDecoration.boxShadow],
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: sb,
          child: Image.asset(
            // width: sb,
            Imagepath.homedemo,
            height: sb,
            fit: BoxFit.fitHeight,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Woodland Appartment", style: AppTextStyles.propertyText),
              Row(
                children: [
                  Icon(
                    IconsaxPlusBold.location,
                    color: Color(0xFFB9B9B9),
                    size: 15,
                  ),
                  Text(
                    "beyorore calicut",
                    style: AppTextStyles.locationtext,
                  )
                ],
              ),
              Text(
                "₹3,40,000",
                style: TextStyle(color: AppColors.primary),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.fieldcolor,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Apartment", style: AppTextStyles.categorytag),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Imagepath.bedroom,
                      width: sb * .25,
                      height: sb * .25,
                    ),
                    Text(
                      "3.0",
                      style: AppTextStyles.featurecount,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      Imagepath.bathroom,
                      width: sb * .25,
                      height: sb * .25,
                    ),
                    Text(
                      "2.0",
                      style: AppTextStyles.featurecount,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      Imagepath.floorno,
                      width: sb * .25,
                      height: sb * .25,
                    ),
                    Text(
                      "2.0",
                      style: AppTextStyles.featurecount,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
