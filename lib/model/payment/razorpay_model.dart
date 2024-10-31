// class PaymentModel {
//   final String senderName;
//   final String paymentId;
//   final double amount;
//   final String propertyId;
//   final String timestamp;

//   PaymentModel({
//     required this.senderName,
//     required this.paymentId,
//     required this.amount,
//     required this.propertyId,
//     required this.timestamp,
//   });

//   factory PaymentModel.fromMap(Map<String, dynamic> data) {
//     return PaymentModel(
//       senderName: data['senderName'],
//       paymentId: data['paymentId'],
//       amount: data['amount'].toDouble(),
//       propertyId: data['propertyId'],
//       timestamp: data['timestamp'],
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentModel {
  final String senderName;
  final int amount;
  final String propertyId;
  final String receiverId;
  final String paymentId;
  final Timestamp timestamp;

  PaymentModel({
    required this.senderName,
    required this.amount,
    required this.propertyId,
    required this.receiverId,
    required this.paymentId,
    required this.timestamp,
  });

  // Factory method to create PaymentModel from Firestore data
  factory PaymentModel.fromMap(Map<String, dynamic> data) {
    return PaymentModel(
      senderName: data['senderName'] ?? 'Unknown Sender', // Default if null
      amount: data['amount'] ?? 0,                        // Default if null
      propertyId: data['propertyId'] ?? 'Not specified',  // Default if null
      receiverId: data['receiverId'] ?? '',               // Assume empty if null
      paymentId: data['paymentId'] ?? '',                 // Assume empty if null
      timestamp: data['timestamp'] ?? Timestamp.now(),    // Default to current time if null
    );
  }
}
