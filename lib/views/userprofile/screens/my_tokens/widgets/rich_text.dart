import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real_estate/model/payment/razorpay_model.dart';
import 'package:real_estate/utils/colors.dart';

RichText richText(PaymentModel payment, dynamic property) {
  return RichText(
      text: TextSpan(children: [
    TextSpan(text: "You recieved ", style: AppTextStyles.tokenText),
    TextSpan(
        text: "₹${NumberFormat('#,##,###').format(payment.amount)} ",
        style: AppTextStyles.tokenText2),
    TextSpan(text: "From ", style: AppTextStyles.tokenText),
    TextSpan(text: "${payment.senderName}\n", style: AppTextStyles.tokenText2),
    TextSpan(
        text: "paymen ID : ${payment.paymentId}\n",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
  ]));
}
