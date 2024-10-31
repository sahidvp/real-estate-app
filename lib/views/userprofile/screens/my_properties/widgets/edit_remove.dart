import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';

Container editRemove(double sw, String action) {
    bool isEdit = action == "Edit";
    return Container(
      decoration: BoxDecoration(
          boxShadow: [AppDecoration.boxShadow],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
          color: Colors.white),
      width: sw * .3,
      child: TextButton(
          onPressed: () {},
          child: Text(
            action,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isEdit ? AppColors.primary : Colors.red),
          )),
    );
  }