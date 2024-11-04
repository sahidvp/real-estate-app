

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/logincontroller.dart';

class PhonenNumberfield extends StatelessWidget {
  final AuthController _authController = Get.find();

  PhonenNumberfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _authController.mobileformKey,
      child: TextFormField(
        controller: _authController.phoneNumber,
        maxLength: 10,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: "Phone number",
          hintStyle: TextStyle(color: Color.fromARGB(255, 217, 214, 214)),
          border: OutlineInputBorder(),
          prefixIcon: Padding(
            padding: EdgeInsets.all(12.0), // Adjust the padding to your needs
            child: Text(
              '+ 91',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            // Get.snackbar("Error", "number field is empty");
            return "Mobile number is required";
          } else if (value.length != 10) {
            return "Mobile number should be 10 digits long";
          }
          return null;
        },
      ),
    );
  }
}
