import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/userprofile/screens/favourite_properties.dart/favourite_property.dart';
import 'package:real_estate/views/userprofile/screens/my_properties/my_properties.dart';
import 'package:real_estate/views/userprofile/widgets/build_card.dart';
import 'package:real_estate/views/userprofile/widgets/build_itemlist.dart';
import 'package:real_estate/views/userprofile/widgets/user_image.dart';
import 'package:real_estate/views/widgets/logoutdialouge.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQueryUtil.screenWidth(context);
    final sh = MediaQueryUtil.screenWidth(context);
    AddpropertyController controller = Get.find();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: AppColors.iconSecondary,
        shadowColor: AppColors.iconSecondary,
        backgroundColor: Colors.transparent,
        // elevation: 10,
        title: const Text('Profile', style: AppTextStyles.mainHeading),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, AppColors.iconSecondary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: sh * .25), // Add space for the AppBar
                  userImage(sw, sh, context),
                  SizedBox(height: sh * .05),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return Text(
                        auth.currentUser?.displayName ?? 'User Name',
                        style: AppTextStyles.subHeading,
                      );
                    },
                  ),
                  SizedBox(height: sh * .05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  buildInfoCard('5.0', 'Properties', Icons.star, context),
                      buildInfoCard('24', 'Properties', Icons.home, context),
                      SizedBox(width: sh * .05),
                      buildInfoCard('10', 'Sold', Icons.sell, context),
                    ],
                  ),
                  SizedBox(height: sh * .05),
                  buildMenuItem(
                      icon: Icons.business,
                      title: 'My properties',
                      onTap: () {
                        Get.to(() => const MyProperties());
                      }),
                  buildMenuItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {},
                  ),
                  buildMenuItem(
                    icon: Icons.favorite,
                    title: 'Favourites',
                    onTap: () {
                      Get.to(() => FavouriteProperty());
                    },
                  ),
                  buildMenuItem(
                    icon: Icons.star,
                    title: 'Rate us',
                    onTap: () {
                      print(controller.favProperties);
                    },
                  ),
                  buildMenuItem(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      print(controller.myProperties);
                    },
                  ),
                  buildMenuItem(
                    icon: Icons.logout,
                    title: 'Sign out',
                    onTap: () {
                      showConfirmationDialog(context);
                    },
                  ),
                  SizedBox(height: sh * .05),
                  const Text('version 1.0.0'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
