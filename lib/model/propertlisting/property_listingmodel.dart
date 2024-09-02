
import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyListingModel {
  final String id;
  final String transactionType; // "Rent" or "Sale"
  final String propertyType; // "House", "Appartments", "Villas"
  final String title;
  final String description;
  final String price;
  final Map<String, String> location;
  final List<String> imageUrls;
  final String bedrooms;
  final String bathrooms;
  final String carParking;
  final String floors;
  final String furnishing; // e.g., "Furnished", "Semi-Furnished", "Unfurnished"
  final String constructionStatus; // e.g., "New Launch", "Ready to Move", "Under Construction"
  final List<String> environment; // List of selected environments (e.g., "Garden", "Gym")
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

  PropertyListingModel({
    this.id = "",
    required this.transactionType,
    required this.propertyType,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.imageUrls,
    required this.bedrooms,
    required this.bathrooms,
    required this.carParking,
    required this.floors,
    required this.furnishing,
    required this.constructionStatus,
    required this.environment,
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

  // Factory constructor to create a Property object from a map
  factory PropertyListingModel.fromMap(DocumentSnapshot map) {
    return PropertyListingModel(
      id: map.id,
      transactionType: map['transactionType'],
      propertyType: map['propertyType'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      location: Map<String, String>.from(map['location']),
      imageUrls: List<String>.from(map['imageUrls']),
      bedrooms: map['bedrooms'],
      bathrooms: map['bathrooms'],
      carParking: map['carParking'],
      floors: map['floors'],
      furnishing: map['furnishing'],
      constructionStatus: map['constructionStatus'],
      environment: List<String>.from(map['environment']),
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

  // Method to convert Property object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'transactionType': transactionType,
      'propertyType': propertyType,
      'title': title,
      'description': description,
      'price': price,
      'location': location,
      'imageUrls': imageUrls,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'carParking': carParking,
      'floors': floors,
      'furnishing': furnishing,
      'constructionStatus': constructionStatus,
      'environment': environment,
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