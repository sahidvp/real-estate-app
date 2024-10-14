import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ListingModel {
  String id;
  String transactionType;
  String title;
  String description;
  String price;
  Map<String, String> location;
  List<String> imageUrls;
  String listedBy;
  String projectName;
  String postedBy;
  String? userImg;
  String postedFrom;
  String category;
  String userId;
  List<String> propertySaved;
  DateTime? timestamp;
  bool hide;
  bool isSold;

  ListingModel({
    required this.id,
    required this.transactionType,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.imageUrls,
    required this.listedBy,
    required this.projectName,
    required this.postedBy,
    this.userImg,
    required this.postedFrom,
    required this.category,
    required this.userId,
    required this.propertySaved,
    this.timestamp,
    required this.hide,
    required this.isSold,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transactionType': transactionType,
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'imageUrls': imageUrls,
      'listedBy': listedBy,
      'projectName': projectName,
      'postedBy': postedBy,
      'userImg': userImg,
      'postedFrom': postedFrom,
      'category': category,
      'userId': userId,
      'hide': hide,
      'isSold': isSold,
      'propertySaved': propertySaved,
      "timestamp": timestamp != null
          ? Timestamp.fromDate(timestamp!)
          : FieldValue.serverTimestamp(),
    };
  }
}
