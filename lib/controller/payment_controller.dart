import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';

import 'firbase/firebase_constant.dart';

class PaymentController extends GetxController {
  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void openCheckout(int amount) {
    var options = {
      'key': 'rzp_test_5CvknA4rDqeKqA', // Replace with your Razorpay test key
      'amount': amount * 100, // Amount in paise (e.g., 100 INR is 10000 paise)
      'name': auth.currentUser?.displayName,
      'description': 'Token for property',
      'prefill': {'contact': '1234567890', 'email': 'test@example.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar("Payment Success", "Payment ID: ${response.paymentId}",
        colorText: Colors.black);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Payment Failed", "Error: ${response.message}",
        colorText: Colors.black);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("External Wallet", "Wallet Name: ${response.walletName}",
        colorText: Colors.black);
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}
