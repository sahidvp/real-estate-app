import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/utils/colors.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: AppColors.primary,
    leading: const Padding(padding: EdgeInsets.all(10), child: ArrowButton()),
    title: Text(title),
    centerTitle: true,
    elevation: 1,
  );
}
