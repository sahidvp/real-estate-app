import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

import 'property_fecilty.dart';

Container tabDetails(double sw, double sh, dynamic property) {
  final category = property.category;
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (category != "Land") ...[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                featureCount(sw, Imagepath.carparking),
                featureCount(sw, Imagepath.bedroom),
                featureCount(sw, Imagepath.bathroom)
              ],
            ),
          ),
        ],
        SizedBox(
          height: sh * .02,
        ),
        listingAgent(sh),
        // SizedBox(
        //   height: sh * .02,
        // ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sw * .04, vertical: sw * .04),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              boxShadow: [AppDecoration.boxShadow],
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Type",
                        style: AppTextStyles.detailText,
                      ),
                      Text("Listed by", style: AppTextStyles.detailText),
                      Text("Floors", style: AppTextStyles.detailText),
                      Text("Area", style: AppTextStyles.detailText),
                      Text(category == "Land" ? "Length" : "Status",
                          style: AppTextStyles.detailText),
                      Text(category == "Land" ? "Breadth" : "Furnishing",
                          style: AppTextStyles.detailText),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("For ${property.transactionType}",
                          style: AppTextStyles.detailText2),
                      Text(property.listedBy, style: AppTextStyles.detailText2),
                      if (category != "Land")
                        Text(property.floors, style: AppTextStyles.detailText2),
                      Text("Built area", style: AppTextStyles.detailText2),
                      Text("Status", style: AppTextStyles.detailText2),
                      Text("Furnishing", style: AppTextStyles.detailText2),
                    ],
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Divider()),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Description",
                  style: AppTextStyles.detailText2,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(property.description)),
            ]),
          ),
        ),
        propertyFeciliities(sw),
        SizedBox(
          height: sh * .02,
        ),
      ],
    ),
  );
}

Padding listingAgent(double sh) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SvgPicture.asset(
              Imagepath.usertemp,
              width: sh * .06,
            ),
          ),
          const Text(" Sandeep. s", style: AppTextStyles.minitext3),
        ],
      ),
      const Icon(
        Icons.messenger,
        color: AppColors.primary,
      )
    ]),
  );
}

Container featureCount(double sw, String svgicon) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [AppDecoration.boxShadow],
        borderRadius: BorderRadius.circular(10)),
    width: sw * .28,
    height: sw * .2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgicon,
          width: sw * .1,
        ),
        Text(
          "3.0",
          style: AppTextStyles.featurecount,
        ),
        Flexible(
            child: Text(
          "Bedroom",
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ))
      ],
    ),
  );
}
