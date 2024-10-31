import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/model/payment/razorpay_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';
import 'package:real_estate/views/userprofile/screens/my_tokens/widgets/rich_text.dart';
import 'package:real_estate/views/userprofile/widgets/app_bar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

import '../../../../controller/payment_controller.dart';

class MyTokens extends StatelessWidget {
  final PaymentController paymentController = Get.put(PaymentController());
  final AddpropertyController propertyController =
      Get.put(AddpropertyController());
  dynamic property;
  var properties = [].obs;

  MyTokens({super.key});

  @override
  Widget build(BuildContext context) {
    paymentController.fetchReceivedPayments(auth.currentUser!.uid);
    return Scaffold(
      backgroundColor: AppColors.fieldcolor,
      appBar: appBar("My tokens"),
      body: Obx(() {
        if (paymentController.receivedPayments.isEmpty) {
          return const Center(
              child: Text(
            "No payments received yet.",
            style: AppTextStyles.tokenText,
          ));
        }

        return ListView.builder(
          itemCount: paymentController.receivedPayments.length,
          itemBuilder: (context, index) {
            PaymentModel payment = paymentController.receivedPayments[index];
            try {
              property = propertyController.properties.firstWhere(
                (prop) => prop.id == payment.propertyId,
                orElse: () => null,
              );
              properties.add(property);
            } catch (e) {
              //  print("Error finding property: $e");
            }
            return Padding(
              padding: EdgeInsets.all(5),
              child: InkWell(
                onTap: () {
                  properties[index] != null
                      ? Get.to(() =>
                          PropertyDetailsView(property: properties[index]))
                      : successSnackbar("Property not exist", "");
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [richText(payment, property)],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
