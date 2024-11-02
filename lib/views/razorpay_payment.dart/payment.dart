import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/listing_property/widgets/build_button.dart';
import 'package:real_estate/views/razorpay_payment.dart/widget/payment_button.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';
import 'package:real_estate/views/widgets/submitbutton.dart';

import '../../controller/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());
  final dynamic property;

  PaymentScreen({super.key, required this.property});

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
        paymentButton(amountController,paymentController,property),
      ]),
    );
  }

 
}
