import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, userName, email, password, notificationToken, imageUrl;
  List<String>? chatWith;
  DateTime? timestamp;
  UserModel({
    this.email,
    this.id,
    this.userName,
    this.password,
    this.notificationToken,
    this.chatWith,
    this.timestamp,
    this.imageUrl,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      email: map["email"],
      userName: map["userName"],
      password: map["password"],
      notificationToken: map["notificationToken"],
      id: map["id"],
      chatWith: map["chatWith"],
      timestamp: (map["timestamp"] as Timestamp?)?.toDate(),
      imageUrl: map["imageUrl"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "userName": userName,
      "password": password,
      "notificationToken": notificationToken,
      "id": id,
      "chatWith": chatWith,
      "timestamp": timestamp != null
          ? Timestamp.fromDate(timestamp!)
          : FieldValue.serverTimestamp(),
      "imageUrl": imageUrl
    };
  }
}