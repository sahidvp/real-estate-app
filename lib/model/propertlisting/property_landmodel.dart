// import 'package:cloud_firestore/cloud_firestore.dart';

// class LandListingModel {
//   final String id;
//   final String transactionType; // "Rent" or "Sale"
//   final String title;
//   final String description;
//   final String price;
//    final String length;
//   final String breadth;

//   final Map<String, String> location;
//   final List<String> imageUrls;
//   final String listedBy; // "Dealer" or "Owner"
//   final String projectName;
//   final String postedBy;
//   final String? userImg;
//   final String postedFrom;
//   final String category;
//   final String userId;
//   final List<String> propertySaved;
//   DateTime? timestamp;
//   bool hide;
//   bool isSold;

//   LandListingModel({
//     this.id = "",
//     required this.transactionType,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.length,
//     required this.breadth,
//     required this.location,
//     required this.imageUrls,
//     required this.listedBy,
//     required this.projectName,
//     required this.postedBy,
//     this.userImg,
//     required this.postedFrom,
//     required this.category,
//     required this.userId,
//     required this.propertySaved,
//     this.timestamp,
//     required this.hide,
//     required this.isSold,
//   });

//   // Factory constructor to create a LandListingModel object from a map
//   factory LandListingModel.fromMap(DocumentSnapshot map) {
//     return LandListingModel(
//       id: map.id,
//       transactionType: map['transactionType'],
//       title: map['title'],
//       description: map['description'],
//       price: map['price'],
//       length: map['length'],
//       breadth: map['breadth'],

//       location: Map<String, String>.from(map['location']),
//       imageUrls: List<String>.from(map['imageUrls']),
//       listedBy: map['listedBy'],
//       projectName: map['projectName'],
//       postedBy: map['postedBy'],
//       userImg: map['userImg'],
//       postedFrom: map['postedFrom'],
//       category: map['category'],
//       userId: map['userId'],
//       hide: map['hide'],
//       isSold: map['isSold'],
//       propertySaved: List<String>.from(map['propertySaved']),
//       timestamp: (map["timestamp"] as Timestamp?)?.toDate(),
//     );
//   }

//   // Method to convert LandListingModel object to a map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'transactionType': transactionType,
//       'title': title,
//       'description': description,
//       'price': price,
//       'location': location,
//       'imageUrls': imageUrls,
//       'listedBy': listedBy,
//       'projectName': projectName,
//       'postedBy': postedBy,
//       'userImg': userImg,
//       'postedFrom': postedFrom,
//       'category': category,
//       'userId': userId,
//       'hide': hide,
//       'isSold': isSold,
//       'propertySaved': propertySaved,
//       "timestamp": timestamp != null
//           ? Timestamp.fromDate(timestamp!)
//           : FieldValue.serverTimestamp(),
//     };
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate/model/propertlisting/property_basemodel.dart';

class LandListingModel extends ListingModel {
  final String length;
  final String breadth;

  LandListingModel({
    String id = "",
    required String transactionType,
    required String title,
    required String description,
    required String price,
    required this.length,
    required this.breadth,
    required Map<String, String> location,
    required List<String> imageUrls,
    required String listedBy,
    required String projectName,
    required String postedBy,
    String? userImg,
    required String postedFrom,
    required String category,
    required String userId,
    required List<String> propertySaved,
    DateTime? timestamp,
    required bool hide,
    required bool isSold,
  }) : super(
          id: id,
          transactionType: transactionType,
          title: title,
          description: description,
          price: price,
          location: location,
          imageUrls: imageUrls,
          listedBy: listedBy,
          projectName: projectName,
          postedBy: postedBy,
          userImg: userImg,
          postedFrom: postedFrom,
          category: category,
          userId: userId,
          propertySaved: propertySaved,
          timestamp: timestamp,
          hide: hide,
          isSold: isSold,
        );
         factory LandListingModel.fromMap(Map<String, dynamic> data) {
    return LandListingModel(
      id: data['id'] ?? "", // Assign ID if available
      transactionType: data['transactionType'],
      title: data['title'],
      description: data['description'],
      price: data['price'],
      length: data['length'], // Specific properties
      breadth: data['breadth'],
      location: Map<String, String>.from(data['location']),
      imageUrls: List<String>.from(data['imageUrls']),
      listedBy: data['listedBy'],
      projectName: data['projectName'],
      postedBy: data['postedBy'],
      userImg: data['userImg'],
      postedFrom: data['postedFrom'],
      category: data['category'],
      userId: data['userId'],
      propertySaved: List<String>.from(data['propertySaved']),
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
      hide: data['hide'],
      isSold: data['isSold'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final baseMap = super.toMap(); // Call toMap from the base class
    baseMap['length'] = length; // Add specific properties
    baseMap['breadth'] = breadth;
    return baseMap; // Return combined map
  }
}
