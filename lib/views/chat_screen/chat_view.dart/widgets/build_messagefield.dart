import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/chat_controller.dart';
import 'package:real_estate/utils/colors.dart';

Row messageField(BuildContext context, String friendID, String? friendToken) {
  final chatCtrl = Get.put(ChatController());

  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01,
              vertical: 5),
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: const BoxDecoration(
            color: AppColors.surface,
          ),
          child: TextField(
            controller: chatCtrl.messageController,
            style: const TextStyle(color: AppColors.primary, fontSize: 20),
            decoration: InputDecoration(
              prefix: const SizedBox(width: 10),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    await chatCtrl.pickAndUploadImage(friendID);
                  },
                  child: const Icon(Icons.attachment_outlined)),
              suffixIconColor: AppColors.primary,
              hintText: "Type here ...",
              
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            ),
          )),
      // const Spacer(),
      CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.primary,
        child: Center(
          child: IconButton(
            onPressed: () async {
              chatCtrl.getChats(friendID);
              await chatCtrl.sentMessage(
                  chatCtrl.messageController.text, friendID, friendToken);
            },
            icon: Icon(
              Icons.send,
              size: 25,
              color: AppColors.fieldcolor,
            ),
          ),
        ),
      ),
    ],
  );
}
