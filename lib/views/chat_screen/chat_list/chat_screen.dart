import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/chat_screen/chat_list/widgets/chat_list.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQueryUtil.getWidthPercentage(context, .5);
    return Scaffold(
        backgroundColor: AppColors.fieldcolor,
        appBar: AppBar(
          centerTitle: true,
          leading: ArrowButton(),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Chats",
            style: AppTextStyles.mainHeading,
          ),
        ),
         body:ChatList()
      
        //
        // Container(
        //   child: ListView.builder(
        //       itemBuilder: (cxt, index) {
        //         return Padding(
        //           padding: EdgeInsets.all(5),
        //           child: Container(
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: Colors.white),
        //             padding: EdgeInsets.all(15),
        //             child: Row(
        //               children: [
        //                 CircleAvatar(
        //                     radius: 30,
        //                     backgroundImage: AssetImage(
        //                       Imagepath.homedemo,
        //                     )),
        //                 SizedBox(
        //                   width: sw * .1,
        //                 ),
        //                 Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         "Sahid",
        //                         style: AppTextStyles.subHeading,
        //                       ),
        //                       Text(
        //                         "dksjdgkjdgf",
        //                         style: AppTextStyles.locationtext,
        //                       )
        //                     ]),
        //                 SizedBox(
        //                   width: sw * .5,
        //                 ),
        //                 Text("2:50 pm")
        //               ],
        //             ),
        //           ),
        //         );
        //       },
        //       itemCount: 4),
        // )
        );
  }
}
