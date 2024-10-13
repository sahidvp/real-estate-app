

import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/home_body.dart';
import 'package:real_estate/views/home_page/home_body/widgets/property_list.dart';
import 'home_body/widgets/carousal_slider.dart';
import 'home_header/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const List category = ["All", "HOUSE", "APARTMENT", "VILLA", "LAND"];

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .1);
    return Scaffold(
      // backgroundColor: AppColors.screenColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: sb * .5,
          ),
          HomeHeader(sb: sb),
          SizedBox(
            height: sb * .2,
          ),
          HomeBodyone(sb: sb, category: category),
          SizedBox(
            height: sb * .2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarousalSlider(sb: sb),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Near You",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  PropertyList(sb: sb),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
