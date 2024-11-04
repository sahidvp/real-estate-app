import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';

import 'build_screens/build_features.dart';
import 'build_screens/build_overview.dart';

import 'build_screens/build_userguide.dart';

class AboutMainScreen extends StatelessWidget {
  const AboutMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fieldcolor,
      appBar: appBar("About us"),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text("Overview"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutOverviewScreen()));
            },
          ),
          ListTile(
            title: const Text("Features"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutFeaturesScreen()));
            },
          ),
          ListTile(
            title: const Text("User Guide"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUserGuideScreen()));
            },
          ),
        ],
      ),
    );
  }
}
