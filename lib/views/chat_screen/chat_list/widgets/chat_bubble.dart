// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import 'package:real_estate/controller/chat_controller.dart';
// import 'package:real_estate/controller/firbase/firebase_constant.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:intl/intl.dart' as intl;

// // ignore: must_be_immutable
// class ChatBubble extends StatelessWidget {
//   ChatBubble({super.key, required this.friendID, required this.friendToken});
//   final chatCtrl = Get.put(ChatController());
//   String friendID;
//   String? friendToken;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           color: Colors.white,
//           margin: EdgeInsets.only(
//               top: MediaQuery.of(context).size.height * 0.01,
//               left: 5,
//               right: 5),
//           height: MediaQuery.of(context).size.height * 0.81,
//           child: StreamBuilder<QuerySnapshot>(
//               stream: chatCtrl.getChats(friendID),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(
//                       child: Text("Start a new\nconversation",
//                           style: AppTextStyles.headline1));
//                 }
//                 return ListView(
//                   reverse: true,
//                   physics: const BouncingScrollPhysics(),
//                   children: snapshot.data!.docs.map((document) {
//                     var data = document.data() as Map<String, dynamic>;
//                     var t = data['created_on'] == null
//                         ? DateTime.now()
//                         : data['created_on'].toDate();
//                     var time = intl.DateFormat("h:mma").format(t);
//                     return Column(
//                       crossAxisAlignment:
//                           data['fromId'] == auth.currentUser!.uid
//                               ? CrossAxisAlignment.end
//                               : CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment:
//                               data['fromId'] == auth.currentUser!.uid
//                                   ? MainAxisAlignment.end
//                                   : MainAxisAlignment.start,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 10, horizontal: 15),
//                               margin: const EdgeInsets.symmetric(
//                                   vertical: 3, horizontal: 10),
//                               decoration: BoxDecoration(
//                                   color: document['fromId'] ==
//                                           auth.currentUser!.uid
//                                       ? AppColors.primary
//                                       : AppColors.fieldcolor,
//                                   borderRadius: BorderRadius.circular(20),
//                                   border: Border.all(
//                                       color: AppColors.primary, width: 0.5)),
//                               child: ConstrainedBox(
//                                 constraints: BoxConstraints(
//                                     maxWidth:
//                                         MediaQuery.of(context).size.width *
//                                             0.7),
//                                 child: document['image_url'] != ""
//                                     ? Container(
//                                         height:
//                                             200, // Set a specific height for the image
//                                         width: MediaQuery.of(context)
//                                                 .size
//                                                 .width *
//                                             0.7, // Optional: maintain width as before
//                                         child: Image.network(
//                                           document['image_url'],
//                                           fit: BoxFit
//                                               .cover, // Adjust the image to cover the entire area
//                                         ),
//                                       )
//                                     : Text(document['msg'],
//                                         style: AppTextStyles.propertyTitle),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal:
//                                   MediaQuery.of(context).size.width * 0.05),
//                           child: Text(
//                             time,
//                             style: AppTextStyles.minitext,
//                           ),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 );
//               }),
//         ),
//         // messageField(context, friendID, friendToken)
//       ],
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/chat_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:intl/intl.dart' as intl;

class ChatBubble extends StatelessWidget {
  ChatBubble({super.key, required this.friendID, required this.friendToken});
  
  final chatCtrl = Get.put(ChatController());
  final String friendID;
  final String? friendToken;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
              left: 5,
              right: 5),
          height: MediaQuery.of(context).size.height * 0.81,
          child: StreamBuilder<QuerySnapshot>(
              stream: chatCtrl.getChats(friendID),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                      child: Text("Start a new\nconversation",
                          style: AppTextStyles.headline1));
                }

                DateTime? lastDate; // To track the last displayed date
                
                return ListView.builder(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var document = snapshot.data!.docs[index];
                    var data = document.data() as Map<String, dynamic>;
                    var messageDate = data['created_on'] == null
                        ? DateTime.now()
                        : data['created_on'].toDate();

                    // Format the date for display
                    String formattedDate = intl.DateFormat.yMMMEd().format(messageDate);

                    // Determine if we need to show the date header
                    bool showDateHeader = false;
                    if (lastDate == null ||
                        intl.DateFormat.yMd().format(lastDate!) != intl.DateFormat.yMd().format(messageDate)) {
                      showDateHeader = true; // New day detected
                      lastDate = messageDate; // Update last date
                    }

                    // Format the time for each message
                    var time = intl.DateFormat("h:mma").format(messageDate);

                    return Column(
                      crossAxisAlignment:
                          data['fromId'] == auth.currentUser!.uid
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                      children: [
                        if (showDateHeader) // Display date header once per day
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Center(
                              child: Text(
                                formattedDate,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                        Row(
                          mainAxisAlignment:
                              data['fromId'] == auth.currentUser!.uid
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: document['fromId'] ==
                                          auth.currentUser!.uid
                                      ? AppColors.primary
                                      : AppColors.fieldcolor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.primary, width: 0.5)),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.7),
                                child: document['image_url'] != ""
                                    ? Container(
                                        height: 200, // Adjust image height
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        child: Image.network(
                                          document['image_url'],
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Text(data['msg'],
                                        style: AppTextStyles.propertyTitle),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05),
                          child: Text(
                            time,
                            style: AppTextStyles.minitext,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }),
        ),
        // messageField(context, friendID, friendToken)
      ],
    );
  }
}
