// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/commonwidgdets/formfields.dart';
// import 'package:real_estate/controller/firbase/firebase_constant.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/views/userprofile/userprofile_screen.dart';
// import 'package:real_estate/views/widgets/submitbutton.dart';

// class EditUserDetails extends StatelessWidget {
//   // Updated class name
//   const EditUserDetails({super.key}); // Updated constructor name

//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.put(AuthController());
//     final username = auth.currentUser?.displayName;
//     authController.fullNameController.text = username!;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("$username"),
//         ),
//         body: Stack(
//           children: [
//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Color.fromARGB(255, 201, 233, 194), Colors.white],
//                     end: Alignment.bottomCenter,
//                     begin: Alignment.center,
//                   ),
//                 ),
//               ),
//             ),
//             Form(
//               key: authController
//                   .usernameformKey, // Assuming the form key is still used
//               child: Padding(
//                 padding: EdgeInsets.all(15),
//                 child: Container(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: 55,
//                           backgroundColor: Colors.white,
//                           child: Icon(
//                             Icons.camera_alt_outlined,
//                             size: 40,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         CustomFormField(
//                           controller: authController.fullNameController,
//                           labelText: "Full name",
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter your name";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         SubmitButton(
//                             controller: authController,
//                             buttonname:
//                                 "Save", // You might want to change this to "Update" or similar
//                             onPressed: () {
//                               if (authController.usernameformKey.currentState!
//                                   .validate()) {
//                                 authController.editUserDetails();
//                                 // This could be renamed to something like updateUserName
//                               }
//                             })
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:real_estate/commonwidgdets/formfields.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/userprofile/widgets/edit_profile.dart';
import 'package:real_estate/views/widgets/submitbutton.dart';

class EditUserDetails extends StatelessWidget {
  const EditUserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      // Wrap in GetBuilder to listen for updates
      init: AuthController(),
      builder: (authController) {
        final username = auth.currentUser?.displayName ?? '';
        authController.fullNameController.text = username;

        return Scaffold(
          appBar: AppBar(
            title: Text(username),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 201, 233, 194),
                        Colors.white
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.center,
                    ),
                  ),
                ),
              ),
              Form(
                key: authController.usernameformKey,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                showEditOptions(context, authController),
                            child: authController.image == null
                                ? CircleAvatar(
                                    radius: 55,
                                    backgroundImage: authController.imgUrl ==
                                            null
                                        ? const AssetImage(Imagepath.homelogo)
                                            as ImageProvider
                                        : NetworkImage(authController.imgUrl!),
                                  )
                                : CircleAvatar(
                                    radius: 55,
                                    backgroundImage:
                                        FileImage(authController.image!),
                                  ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomFormField(
                            controller: authController.fullNameController,
                            labelText: "Full name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SubmitButton(
                            controller: authController,
                            buttonname: "Update",
                            onPressed: () {
                              if (authController.usernameformKey.currentState!
                                  .validate()) {
                                authController.editUserDetails();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
