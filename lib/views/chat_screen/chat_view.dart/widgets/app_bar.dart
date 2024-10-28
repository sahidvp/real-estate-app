import 'package:flutter/material.dart';

import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

AppBar appbarMessage(List friendData) {
  return AppBar(
    shape: Border(
      bottom: BorderSide(color: AppColors.primary, width: 1),
    ),
    foregroundColor: Colors.black,
    backgroundColor: AppColors.fieldcolor,
    toolbarHeight: 65,
    title: Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: friendData[1] == null
              ? const AssetImage(
                  Imagepath.usertemp,
                ) as ImageProvider
              : NetworkImage(friendData[1].toString()),
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
