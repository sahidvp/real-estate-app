import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/category_tag.dart';
import 'package:real_estate/utils/colors.dart';

SliverList silverList(double sh, SizedBox sb,
    {required String category, required String tittle, required location}) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColors.fieldcolor, width: 2.5))),
          child: Padding(
            padding: EdgeInsets.only(left: sh),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sb,
                categoryTag(category),
                Text(
                  tittle,
                  style: AppTextStyles.propertyTitle,
                ),
                Text(
                  location,
                  style: AppTextStyles.locationtext,
                ),
                sb
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
