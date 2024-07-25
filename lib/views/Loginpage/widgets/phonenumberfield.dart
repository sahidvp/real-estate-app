// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/views/widgets/submitbutton.dart';

// class PhoneNumberInputForm extends StatelessWidget {
//   final AuthController _authController = Get.find();

//   PhoneNumberInputForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     try {
//       return Column(children: [
//         InternationalPhoneNumberInput(

//           onInputChanged: (PhoneNumber number) {
//             _authController.phoneNumber.text = number.phoneNumber ?? '';
//           },
//           onInputValidated: (bool value) {},
//           selectorConfig: SelectorConfig(
//             selectorType: PhoneInputSelectorType.DROPDOWN,
//           ),
//           ignoreBlank: false,
//           autoValidateMode: AutovalidateMode.disabled,
//           selectorTextStyle: TextStyle(color: Colors.black),
//           initialValue: PhoneNumber(isoCode: 'IN'),
//           textFieldController: _authController.phoneNumber,
//           formatInput: false,
//           keyboardType:
//               TextInputType.numberWithOptions(signed: true, decimal: true),
//           inputDecoration: InputDecoration(

//             hintText: 'Phone Number',
//           ),
//         ),
//         SubmitButton(
//             controller: _authController,
//             buttonname: "send otp",
//             onPressed: () async {
//               await _authController.sentOtp();
//             })
//       ]);
//     } catch (e) {
//       print('Error in PhoneNumberInputForm: $e');
//       return Center(child: Text('Error loading phone number input'));
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/views/widgets/submitbutton.dart';

// class PhoneNumberInputForm extends StatelessWidget {
//   final AuthController _authController = Get.find();

//   PhoneNumberInputForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     try {
//       return Column(children: [
//         InternationalPhoneNumberInput(
//           onInputChanged: (PhoneNumber number) {
//             _authController.phoneNumber.text = number.phoneNumber ?? '';
//           },
//           onInputValidated: (bool value) {},
//           selectorConfig: SelectorConfig(
//             selectorType: PhoneInputSelectorType.DIALOG,
//             showFlags: true,
//             useEmoji: true,
//             setSelectorButtonAsPrefixIcon: true,
//             leadingPadding: 5.0,
//           ),
//           ignoreBlank: false,
//           autoValidateMode: AutovalidateMode.disabled,
//           selectorTextStyle: TextStyle(color: Colors.black),
//           initialValue: PhoneNumber(isoCode: 'IN'),
//           textFieldController: _authController.phoneNumber,
//           formatInput: false,
//           keyboardType:
//               TextInputType.numberWithOptions(signed: true, decimal: true),
//           inputDecoration: InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Phone Number',
//           ),
//         ),
//         SizedBox(height: 20), // Add some spacing before the button
//         SubmitButton(
//           controller: _authController,
//           buttonname: "Send OTP",
//           onPressed: () async {
//             await _authController.sentOtp();
//           },
//         )
//       ]);
//     } catch (e) {
//       print('Error in PhoneNumberInputForm: $e');
//       return Center(child: Text('Error loading phone number input'));
//     }
//   }
// }

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
      child: TextFormField(
        controller: _authController.phoneNumber,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: "Phone number",
          hintStyle: TextStyle(color: const Color.fromARGB(255, 217, 214, 214)),
          border: const OutlineInputBorder(),
          prefixIcon: const Padding(
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
            return "empty field";
          } else if (value.length != 10) {
            Get.snackbar("Error", "Invalid phone number");
          }
          return null;
        },
      ),
    );
  }
}
