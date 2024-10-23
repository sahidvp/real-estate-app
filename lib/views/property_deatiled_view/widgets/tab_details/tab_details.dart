import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

import '../property_fecilty.dart';

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
                featureCount(
                    sw, Imagepath.carparking, "Parking", property.carParking),
                featureCount(
                    sw, Imagepath.bedroom, "Bedroom", property.bedrooms),
                featureCount(
                    sw, Imagepath.bathroom, "Bathroom", property.bathrooms)
              ],
            ),
          ),
        ],
        SizedBox(
          height: sh * .02,
        ),
        listingAgent(sh, property),
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
                      if (category != "Land")
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
                      Text(property.areasqft, style: AppTextStyles.detailText2),
                      Text(
                          category == "Land"
                              ? property.length
                              : property.constructionStatus,
                          style: AppTextStyles.detailText2),
                      Text(
                          category == "Land"
                              ? property.breadth
                              : property.furnishing,
                          style: AppTextStyles.detailText2),
                    ],
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Divider()),
              const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Description",
                  style: AppTextStyles.detailText2,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Text(property.description)),
            ]),
          ),
        ),
        if (category != "Land") propertyFeciliities(sw,property.environment),
        SizedBox(
          height: sh * .02,
        ),
      ],
    ),
  );
}

Padding listingAgent(double sh, dynamic property) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          CircleAvatar(
              child: property.userImg != null
                  ? ClipOval(
                      child: Image.network(
                        fit: BoxFit.cover,
                        property.userImg,
                        width: sh * .08,
                      ),
                    )
                  : SvgPicture.asset(
                      Imagepath.usertemp,
                      width: sh * .06,
                      height: sh * .06,
                    )),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(property.postedBy, style: AppTextStyles.minitext3)),
        ],
      ),
      const Icon(
        IconsaxPlusBold.sms,
        color: AppColors.primary,
      )
    ]),
  );
}

Container featureCount(double sw, String svgicon, String feature, featCount) {
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
          width: sw * .06,
        ),
        Text(
          featCount,
          style: AppTextStyles.featurecount,
        ),
        Flexible(
            child: Text(
          feature,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ))
      ],
    ),
  );
}
