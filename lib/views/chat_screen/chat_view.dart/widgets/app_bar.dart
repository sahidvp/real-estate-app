import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

AppBar appbarMessage(List friendData) {
  return AppBar(
    shape: const Border(
      bottom: BorderSide(color: Colors.black, width: 1),
    ),
    surfaceTintColor: AppColors.surface,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    toolbarHeight: 65,
    elevation: 0,
    title: Row(
      children: [
        friendData[1] == null
            ? Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.grey.shade200, // Background color for placeholder
                ),
                child: SvgPicture.asset(
                  Imagepath.usertemp,
                  fit: BoxFit.cover,
                ),
              )
            : CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(friendData[1].toString()),
              ),
        const SizedBox(
          width: 15,
        ),
        Text(
          friendData[0] ?? "",
          style: AppTextStyles.subHeading,
        ),
      ],
    ),
  );
}
