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
            decoration: const BoxDecoration(
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
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
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
                    const SizedBox(
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
