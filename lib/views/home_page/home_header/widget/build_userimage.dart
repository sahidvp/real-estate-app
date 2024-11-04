import 'package:flutter/material.dart';

import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

Container buildUserimage(AuthController cntrl, double sb) {
  return Container(
    decoration: BoxDecoration(boxShadow: [AppDecoration.boxShadow]),
    child: CircleAvatar(
      radius: sb * .3,
      backgroundImage: cntrl.image != null
          ? FileImage(cntrl.image!)
          : (cntrl.imgUrl != null
              ? NetworkImage(cntrl.imgUrl!) as ImageProvider
              : const AssetImage(
                  Imagepath.homelogo)), // Fallback to a PNG placeholder
      // child: cntrl.image == null && cntrl.imgUrl == null
      //     ? SvgPicture.asset(
      //         Imagepath.usertemp,
      //         fit: BoxFit.cover,
      //       )
      //     : null,
    ),
  );
}
