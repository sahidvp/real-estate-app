// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/imagespath.dart';
// import 'package:real_estate/views/Loginpage/loginwithmobile/save_username.dart';
// import 'package:real_estate/views/userprofile/widgets/edit_profile.dart';
// import 'package:real_estate/views/userprofile/widgets/edit_userdetail.dart';

// Stack userImage(double sw, double sh, BuildContext context) {
//   AuthController cntrl = Get.put(AuthController());
//   return Stack(
//     clipBehavior: Clip.none,
//     alignment: Alignment.bottomRight,
//     children: [
//       Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: AppColors.primary,
//             width: 2,
//           ),
//         ),
//         child: cntrl.image == null
//             ? CircleAvatar(
//                 radius: 55,
//                 backgroundImage: cntrl.imgUrl == null
//                     ? const AssetImage(Imagepath.homelogo) as ImageProvider
//                     : NetworkImage(cntrl.imgUrl!),
//               )
//             : CircleAvatar(
//                 radius: 55,
//                 backgroundImage: FileImage(cntrl.image!),
//               ),
//       ),
//       Positioned(
//         bottom: -3,
//         right: 3,
//         child: Container(
//           width: sw * .1,
//           height: sh * .1,
//           decoration: BoxDecoration(
//             color: AppColors.primary,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 4,
//               ),
//             ],
//           ),
//           child: IconButton(
//             icon: Icon(
//               Icons.edit,
//               color: Colors.black,
//               size: sh * .05,
//             ),
//             onPressed: () {
//               // showEditOptions(context, cntrl);
//               Get.to(const EditUserDetails());
//             },
//           ),
//         ),
//       ),
//     ],
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/userprofile/widgets/edit_userdetail.dart';

Stack userImage(double sw, double sh, BuildContext context) {
  AuthController cntrl = Get.put(AuthController());

  return Stack(
    clipBehavior: Clip.none,
    alignment: Alignment.bottomRight,
    children: [
      GetBuilder<AuthController>(
        builder: (_) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: cntrl.image == null
                ? CircleAvatar(
                    radius: 55,
                    backgroundImage: cntrl.imgUrl == null
                        ? const AssetImage(Imagepath.usertemp) as ImageProvider
                        : NetworkImage(cntrl.imgUrl!),
                  )
                : CircleAvatar(
                    radius: 55,
                    backgroundImage: FileImage(cntrl.image!),
                  ),
          );
        },
      ),
      Positioned(
        bottom: -3,
        right: 3,
        child: Container(
          width: sw * .1,
          height: sh * .1,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
              size: sh * .05,
            ),
            onPressed: () {
              // Update the image using any method inside the controller and call update()
              Get.to(const EditUserDetails());
            },
          ),
        ),
      ),
    ],
  );
}
