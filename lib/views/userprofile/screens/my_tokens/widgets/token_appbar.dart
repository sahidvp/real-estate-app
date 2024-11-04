import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/utils/colors.dart';

AppBar tokensAppbar() {
  return AppBar(
    backgroundColor: AppColors.primary,
    leading: const Padding(padding: EdgeInsets.all(10), child: ArrowButton()),
    title: const Text("My tokens"),
    centerTitle: true,
    elevation: 1,
    bottom: const TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.black,
      tabs: [
        Tab(text: "Received Tokens"),
        Tab(text: "Sent Tokens"),
      ],
    ),
  );
}
