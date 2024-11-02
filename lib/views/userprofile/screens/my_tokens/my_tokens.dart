import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/commonwidgdets/backbutton.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/model/payment/razorpay_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';
import 'package:real_estate/views/userprofile/screens/my_tokens/widgets/buil_tokenlist.dart';
import 'package:real_estate/views/userprofile/screens/my_tokens/widgets/rich_text.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

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
