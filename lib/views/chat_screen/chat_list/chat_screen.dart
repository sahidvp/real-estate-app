import 'package:flutter/material.dart';

import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/views/chat_screen/chat_list/widgets/chat_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.fieldcolor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Chats",
            style: AppTextStyles.mainHeading,
          ),
        ),
        body: ChatList());
  }
}
