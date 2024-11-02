import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/model/payment/razorpay_model.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';
import 'package:real_estate/views/userprofile/screens/my_tokens/widgets/rich_text.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

Widget buildTokenList(
    List<PaymentModel> payments, String emptyMessage, bool isreciept) {
  final AddpropertyController propertyController =
      Get.put(AddpropertyController());
  return payments.isEmpty
      ? Center(
          child: Text(
            emptyMessage,
            style: AppTextStyles.tokenText,
          ),
        )
      : ListView.builder(
          itemCount: payments.length,
          itemBuilder: (context, index) {
            PaymentModel payment = payments[index];

            var property = propertyController.properties.firstWhere(
              (prop) => prop.id == payment.propertyId,
              orElse: () => null,
            );

            return Padding(
              padding: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  property != null
                      ? Get.to(() => PropertyDetailsView(property: property))
                      : successSnackbar("Property not exist", "");
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isreciept
                          ? richText(payment, property)
                          : richTextTwo(payment, property)
                    ],
                  ),
                ),
              ),
            );
          },
        );
}
