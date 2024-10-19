 import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/commonwidgdets/heart_button.dart';
import 'package:real_estate/controller/homepage_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

SliverAppBar silverAppbar(HomeBodyController hController,String propImg) {
    return SliverAppBar(
            surfaceTintColor: Colors.transparent,
            leading: ArrowButton(),
            actions: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.fieldcolor,
                  shape: BoxShape.circle,
                ),
                child: heartButton(hController),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0, // No shadow
            expandedHeight: 250.0, // Height of the app bar when expanded
            floating: true,
            pinned:
                true, // Keeps the app bar pinned at the top after collapsing
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(propImg
                    , 
                    fit: BoxFit.cover, // Make the image fill the space
                  ),
                  Container(
                    color: Colors.black.withOpacity(
                        0.3), // Dark overlay for better text visibility
                  ),
                ],
              ),
            ),
            // TabBar inside the SliverAppBar
            bottom: TabBar(
              labelStyle: AppTextStyles.propertyText,
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: AppColors.primary, // Highlight active tab
              labelColor: AppColors.primary,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(text: "Details"), // First Section Tab
                Tab(text: "Gallery"), // Second Section Tab
              ],
            ),
          );
  }
