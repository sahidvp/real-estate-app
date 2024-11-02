// import 'package:cloud_firestore/cloud_firestore.dart';

// class PaymentModel {
//   final String senderName;
//   final int amount;
//   final String propertyId;
//   final String receiverId;
//   final String paymentId;
//   final Timestamp timestamp;

//   PaymentModel({
//     required this.senderName,
//     required this.amount,
//     required this.propertyId,
//     required this.receiverId,
//     required this.paymentId,
//     required this.timestamp,
//   });

//   // Factory method to create PaymentModel from Firestore data
//   factory PaymentModel.fromMap(Map<String, dynamic> data) {
//     return PaymentModel(
//       senderName: data['senderName'] ?? 'Unknown Sender', // Default if null
//       amount: data['amount'] ?? 0,                        // Default if null
//       propertyId: data['propertyId'] ?? 'Not specified',  // Default if null
//       receiverId: data['receiverId'] ?? '',               // Assume empty if null
//       paymentId: data['paymentId'] ?? '',                 // Assume empty if null
//       timestamp: data['timestamp'] ?? Timestamp.now(),    // Default to current time if null
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class PaymentModel {
  final String senderName;
  final int amount;
  final String propertyId;
  final String receiverId;
  final String paymentId;
  final Timestamp timestamp;
  final String senderId; // New senderId field

  PaymentModel({
    required this.senderName,
    required this.amount,
    required this.propertyId,
    required this.receiverId,
    required this.paymentId,
    required this.timestamp,
    required this.senderId, // Initialize senderId
  });

  // Factory method to create PaymentModel from Firestore data
  factory PaymentModel.fromMap(Map<String, dynamic> data) {
    return PaymentModel(
      senderName: data['senderName'] ?? 'Unknown Sender', // Default if null
      amount: data['amount'] ?? 0, // Default if null
      propertyId: data['propertyId'] ?? 'Not specified', // Default if null
      receiverId: data['receiverId'] ?? '', // Assume empty if null
      paymentId: data['paymentId'] ?? '', // Assume empty if null
      timestamp: data['date'] ??
          Timestamp.now(), // Default to current time if null
      senderId: data['senderId'] ?? '', // New senderId with default empty
    );
  }

  String get formattedDate {
    DateTime date = timestamp.toDate();
    return DateFormat('dd MMM yyyy').format(date); // Format: "12 Sep 2024"
  }
}
