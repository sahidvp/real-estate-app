import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';

Container categoryTag(property) {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.fieldcolor, borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(property, style: AppTextStyles.categorytag),
    ),
  );
}
