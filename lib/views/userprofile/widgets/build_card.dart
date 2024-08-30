import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';

Widget buildInfoCard(String count, String label, IconData icon, context) {
  final width = MediaQueryUtil.getWidthPercentage(context, .25);
  return Column(
    children: [
      Container(
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.primary),
            const SizedBox(height: 5),
            Text(count, style: AppTextStyles.mainHeading),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    ],
  );
}
