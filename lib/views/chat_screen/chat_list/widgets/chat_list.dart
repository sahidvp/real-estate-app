import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/chat_controller.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';


import 'message_bubble.dart';

// ignore: must_be_immutable
class ChatList extends StatelessWidget {
  ChatList({super.key});
  final chatCtrl = Get.put(ChatController());
  final authCtrl = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
       final sw = MediaQueryUtil.getWidthPercentage(context, .5);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: StreamBuilder(
          stream: chatCtrl.getMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "no messages",
                
                ),
              );
            } else {
              return FutureBuilder<List<List<dynamic>>>(
                future: chatCtrl.getListChatWith(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ));
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No chats available'));
                  }

                  final chatList = snapshot.data!;

                  return ListView.builder(
                    itemCount: chatList.length,
                    itemBuilder: (ctx, index) {
                      final userDetails = chatList[index];

                      return messageBubble(userDetails[0], userDetails[1],
                          userDetails[2], userDetails[3],sw);
                    },
                  );
                },
              );
            }
          }),
    );
  }


  

}
