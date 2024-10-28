import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';

AppBar appBar(String title) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: ArrowButton(),
      title: Text(title),
      centerTitle: true,
      elevation: 1,
    );
  }