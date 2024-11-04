import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/userprofile/screens/settings/privacy_policy.dart';
import 'package:real_estate/views/userprofile/screens/settings/terms_condition.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';
import 'package:real_estate/views/userprofile/widgets/build_itemlist.dart';

import '../../../widgets/logoutdialouge.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fieldcolor,
      appBar: appBar("Settings"),
      body: ListView(
        children: [
          buildMenuItem(
              icon: Icons.privacy_tip,
              title: "privacy poicy",
              onTap: () {
                Get.to(() => const PrivacyPolicy());
              }),
          buildMenuItem(
              icon: Icons.article,
              title: "Terms and condition",
              onTap: () {
                Get.to(() => const Terms());
              }),
          buildMenuItem(
            icon: Icons.logout,
            title: 'Sign out',
            onTap: () {
              showConfirmationDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
