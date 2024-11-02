import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/controller/payment_controller.dart';
import 'package:real_estate/utils/colors.dart';

ElevatedButton paymentButton(TextEditingController amountController,
    PaymentController paymentController, dynamic property) {
  return ElevatedButton(
    onPressed: () {
     
      int amount =
          int.tryParse(amountController.text) ?? 0; 
      if (amount > 0) {
        paymentController.setPaymentDetails(
            property.id, auth.currentUser!.uid, property.userId, amount);
        paymentController.openCheckout();
      } else {
        Get.snackbar("Error", "Please enter a valid amount",
            colorText: Colors.red);
      }
    },
    style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        backgroundColor: AppColors.primary),
    child: Text("Pay Now"),
  );
}
