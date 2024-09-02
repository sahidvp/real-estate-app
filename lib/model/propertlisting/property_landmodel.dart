import 'package:cloud_firestore/cloud_firestore.dart';

class LandListingModel {
  final String id;
  final String transactionType; // "Rent" or "Sale"
  final String title;
  final String description;
  final String price;
   final String length;
  final String breadth;

  final Map<String, String> location;
  final List<String> imageUrls;
  final String listedBy; // "Dealer" or "Owner"
  final String projectName;
  final String postedBy;
  final String? userImg;
  final String postedFrom;
  final String category;
  final String userId;
  final List<String> propertySaved;
  DateTime? timestamp;
  bool hide;
  bool isSold;

  LandListingModel({
    this.id = "",
    required this.transactionType,
    required this.title,
    required this.description,
    required this.price,
    required this.length,
    required this.breadth,
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

  // Factory constructor to create a LandListingModel object from a map
  factory LandListingModel.fromMap(DocumentSnapshot map) {
    return LandListingModel(
      id: map.id,
      transactionType: map['transactionType'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      length: map['length'],
      breadth: map['breadth'],

      location: Map<String, String>.from(map['location']),
      imageUrls: List<String>.from(map['imageUrls']),
      listedBy: map['listedBy'],
      projectName: map['projectName'],
      postedBy: map['postedBy'],
      userImg: map['userImg'],
      postedFrom: map['postedFrom'],
      category: map['category'],
      userId: map['userId'],
      hide: map['hide'],
      isSold: map['isSold'],
      propertySaved: List<String>.from(map['propertySaved']),
      timestamp: (map["timestamp"] as Timestamp?)?.toDate(),
    );
  }

  // Method to convert LandListingModel object to a map
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
