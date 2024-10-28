import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/chat_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/chat_screen/chat_view.dart/chat_view.dart';

Padding messageBubble(
    String username, String? imageUrl, String friendID, String? friendToken) {
  final chatCtrl = Get.put(ChatController());

  return Padding(
    padding: const EdgeInsets.all(10),
    child: ListTile(
      onTap: () async {
        await chatCtrl.getOrCreateChat(auth.currentUser!.uid, friendID);
        Get.to(
          () => ChattingScreen(
            friendId: friendID,
            friendToken: friendToken,
          ),
          transition: Transition.rightToLeft,
        );
      },
      leading: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(50)),
        child: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.black12,
          backgroundImage: imageUrl == null
              ? const AssetImage(
                  "assets/profile.jpeg",
                ) as ImageProvider
              : NetworkImage(
                  imageUrl,
                ),
        ),
      ),
      title: Text(
        username,
        style: AppTextStyles.subHeading,
      ),
      subtitle: Text(
        "message",
      ),
    ),
  );
}
