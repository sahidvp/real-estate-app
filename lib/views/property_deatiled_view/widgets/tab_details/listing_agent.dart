import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/chat_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

import 'package:real_estate/views/chat_screen/chat_view.dart/chat_view.dart';

Padding listingAgent(double sh, dynamic property) {
  final chatCtrl = Get.put(ChatController());
  final authCtrl = Get.put(AuthController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 17),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          CircleAvatar(
              child: property.userImg != null
                  ? ClipOval(
                      child: Image.network(
                        fit: BoxFit.cover,
                        property.userImg,
                        width: sh * .08,
                      ),
                    )
                  : SvgPicture.asset(
                      Imagepath.usertemp,
                      width: sh * .06,
                      height: sh * .06,
                    )),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(property.postedBy, style: AppTextStyles.minitext3)),
        ],
      ),
      property.userId == auth.currentUser!.uid
          ? const SizedBox.shrink()
          : messageButton(authCtrl, chatCtrl, property)
    ]),
  );
}

ElevatedButton messageButton(
    AuthController aCtrl, ChatController cCtrl, dynamic property) {
  return ElevatedButton(
    onPressed: () async {
      await cCtrl.getOrCreateChat(auth.currentUser!.uid, property.userId);
      final data = await aCtrl.getUserDetailsByUId(property.userId);
      Get.to(() =>
          ChattingScreen(friendId: property.userId, friendToken: data[3]));
    },
    child: const Icon(
      IconsaxPlusBold.sms,
      color: AppColors.primary,
    ),
  );
}
