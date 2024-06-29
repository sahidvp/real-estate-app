import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';

class Onbordingtext {
  final List<TextSpan> onbordingpageoneText = [
    const TextSpan(text: "Find best place\n", style: AppTextStyles.headline1),
    const TextSpan(text: "to stay in ", style: AppTextStyles.headline1),
    const TextSpan(
        text: "good in price",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color:AppColors.textPrimary,
        )),
  ];

  final List<TextSpan> onbordingpagetwoText = [
    const TextSpan(
        text: "Fast sell your property\n", style: AppTextStyles.headline1),
    const TextSpan(text: "in just ", style: AppTextStyles.headline1),
    const TextSpan(
        text: "one click",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        )),
  ];

  final List<TextSpan> onbordingpagethreeText = [
    const TextSpan(
        text: "Find perfect choice for\n", style: AppTextStyles.headline1),
    const TextSpan(text: "your ", style: AppTextStyles.headline1),
    const TextSpan(
        text: "future house",
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        )),
  ];
}
