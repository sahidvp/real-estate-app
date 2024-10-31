import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';

import '../../controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    return Scaffold(
      appBar: appBar("Razorpay Payment"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: AppColors.surface)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                label: Text(
                  "Enter your token amount",
                  style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                )),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Get the amount entered by the user and convert it to paise
            int amount = int.tryParse(amountController.text) ??
                0; // Use 0 if parsing fails
            if (amount > 0) {
              paymentController
                  .openCheckout(amount); // Pass the amount to the method
            } else {
              Get.snackbar("Error",
                  "Please enter a valid amount"); // Show an error if the amount is invalid
            }
          },
          child: Text("Pay Now"),
        ),
      ]),
    );
  }
}
