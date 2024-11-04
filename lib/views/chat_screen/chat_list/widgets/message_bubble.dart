import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/controller/chat_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/chat_screen/chat_view.dart/chat_view.dart';

InkWell messageBubble(String username, String? imageUrl, String friendID,
    String? friendToken, double sw) {
  final chatCtrl = Get.put(ChatController());

  return InkWell(
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
    child: Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            imageUrl == null
                ? Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: SvgPicture.asset(
                      Imagepath.usertemp,
                      fit: BoxFit.cover,
                    ),
                  )
                : CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
            SizedBox(width: sw * .1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: AppTextStyles.subHeading,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: chatCtrl.getLastMessage(chatCtrl.generateChatId(
                        auth.currentUser!.uid, friendID)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          "Loading...",
                          style: AppTextStyles.locationtext,
                        );
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Text(
                          "No messages yet",
                          style: AppTextStyles.locationtext,
                        );
                      }

                      // Access the last message document
                      var lastMessageDoc = snapshot.data!.docs.first;
                      var data = lastMessageDoc.data() as Map<String, dynamic>;

                      // Retrieve the message, sender, and timestamp info
                      String lastMessage = data['msg'] ?? "No messages yet";
                      String senderId = data['fromId'] ?? ""; // The sender's ID
                      DateTime messageTime = data['created_on'] != null
                          ? (data['created_on'] as Timestamp).toDate()
                          : DateTime.now();
                      String formattedTime =
                          DateFormat('h:mm a').format(messageTime);

                      // Prepend "You: " if the message is from the current user
                      String messageText = senderId == auth.currentUser!.uid
                          ? "You: $lastMessage"
                          : lastMessage;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              messageText,
                              style: AppTextStyles.locationtext,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formattedTime,
                            style: AppTextStyles.locationtext
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
