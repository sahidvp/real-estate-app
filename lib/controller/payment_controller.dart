import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:real_estate/views/property_deatiled_view/propery_details.dart';

import '../model/payment/razorpay_model.dart';
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

  // void openCheckout(int amount) {
  //   var options = {
  //     'key': 'rzp_test_5CvknA4rDqeKqA', // Replace with your Razorpay test key
  //     'amount': amount * 100, // Amount in paise (e.g., 100 INR is 10000 paise)
  //     'name': auth.currentUser?.displayName,
  //     'description': 'Token for property',
  //     'prefill': {'contact': '1234567890', 'email': 'test@example.com'},
  //     'external': {
  //       'wallets': ['paytm']
  //     }
  //   };

  //   try {
  //     _razorpay.open(options);
  //   } catch (e) {
  //     debugPrint("Error: $e");
  //   }
  // }
  var propertyId = ''.obs;
  var senderName = auth.currentUser?.displayName;
  var senderId = "".obs;
  var receiverId = ''.obs;
  var amount = 0.obs;

  void setPaymentDetails(
      String property, String senderid, String receiver, int amt) {
    propertyId.value = property;
    senderId.value = senderid;
    receiverId.value = receiver;
    amount.value = amt;
  }

  void openCheckout() {
    var options = {
      'key': 'rzp_test_5CvknA4rDqeKqA',
      'amount': amount * 100, // Amount in paise
      'name': senderName,
      'description': 'Token advance for property ID: $propertyId',
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

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Get.snackbar("Payment Success", "Payment ID: ${response.paymentId}",
        colorText: Colors.black);

    await FirebaseFirestore.instance.collection('payments').add({
      'paymentId': response.paymentId,
      'senderName': senderName,
      'propertyId': propertyId.value,
      'receiverId': receiverId.value,
      'amount': amount.value,
      'date': Timestamp.now(),
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Payment Failed", "Error: ${response.message}",
        colorText: Colors.black);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("External Wallet", "Wallet Name: ${response.walletName}",
        colorText: Colors.black);
  }

  //ffetching payment details
  var receivedPayments = <PaymentModel>[].obs;

  void fetchReceivedPayments(String receiverId) async {
    print("payment method called");
    // Fetch payments where the receiver ID matches
    var querySnapshot = await FirebaseFirestore.instance
        .collection('payments')
        .where('receiverId', isEqualTo: receiverId)
        .get();

    receivedPayments.value = querySnapshot.docs.map((doc) {
      return PaymentModel.fromMap(doc.data());
    }).toList();
    print(receivedPayments.length);
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
}
