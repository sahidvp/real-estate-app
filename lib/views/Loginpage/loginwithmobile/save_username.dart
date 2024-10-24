import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/commonwidgdets/formfields.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/views/widgets/submitbutton.dart';

class SaveUsername extends StatelessWidget {
  const SaveUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 201, 233, 194), Colors.white],
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
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
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
                        buttonname: "Save",
                        onPressed: () {
                          if (authController.usernameformKey.currentState!
                              .validate()) {
                            authController.saveUserNameNum();
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
