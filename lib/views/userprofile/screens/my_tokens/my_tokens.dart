import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_estate/controller/firbase/firebase_constant.dart';

import 'package:real_estate/utils/colors.dart';

import 'package:real_estate/views/userprofile/screens/my_tokens/widgets/buil_tokenlist.dart';


import '../../../../controller/payment_controller.dart';
import 'widgets/token_appbar.dart';

class MyTokens extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());
  

  MyTokens({super.key}) {
    final userId = auth.currentUser!.uid;
    paymentController.fetchReceivedPayments(userId);
    paymentController.fetchSentPayments(userId);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.fieldcolor,
        appBar: tokensAppbar(),
        body: TabBarView(
          children: [
            // Received tokens list
            Obx(() => buildTokenList(paymentController.receivedPayments,
                "No payments received yet.", true)),

            // Sent tokens list
            Obx(() => buildTokenList(paymentController.sentPayments,
                "No payments sent yet.", false)),
          ],
        ),
      ),
    );
  }

  
}
