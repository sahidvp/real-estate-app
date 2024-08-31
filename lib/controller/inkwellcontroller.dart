// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:real_estate_application/controller/indexcontroller.dart';
// import 'package:real_estate_application/model/properties_land_model.dart';
// import 'package:real_estate_application/model/properties_house_apartment_model.dart';
// import 'package:real_estate_application/view/bottom_nav/bottom_navbar.dart';
// import 'package:real_estate_application/view/custom_widget/snackbar/error.dart';
// import 'package:real_estate_application/view/custom_widget/snackbar/success.dart';
// import 'package:real_estate_application/view/profile/profile_page_options/my_properties/my_properties_page.dart';

// class PropertyController extends GetxController {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   FirebaseFirestore db = FirebaseFirestore.instance;

//   String category = '';
//   String? type;
//   TextEditingController title = TextEditingController();
//   TextEditingController description = TextEditingController();
//   TextEditingController price = TextEditingController();
//   Map<String, String> location = {
//     "country": "",
//     "state": "",
//     "city": "",
//   };
//   List<String> imageUrls = [];
//   final isLoading = false.obs;
//   String? listedBy;
//   String? furnishing;
//   String? constructionStatus;
//   String? carParking;
//   String? bedrooms;
//   String? bathrooms;
//   TextEditingController areaftsq = TextEditingController();
//   String? floors;
//   String facingDirection = "";
//   TextEditingController length = TextEditingController();
//   TextEditingController breadth = TextEditingController();
//   TextEditingController plotArea = TextEditingController();
//   String postedBy = "";
//   String postedFrom = "";
//   List<int> selectedOptions = [];
//   List<String> propertySaved = [];
//   static bool editMode = false;
//   static String? propertyId;
//   static dynamic dataForEdit;
//   final searchData = "".obs;
//   final isPropertySaved = false.obs;
//   final indexCtrl = Get.put(IndexController());
//   ///// data for filter
//   String? categoryFilter;
//   String? typeFilter;
//   String? constructionStatusFilter;
//   String? listedByFilter;
//   String? floorsFilter;
//   String? bedFilter;
//   String? bathFilter;
//   String? furnishingFilter;
//   bool? lowToHighPriceFilter;
//   int? startingRange;
//   int? endingRange;

//   getAllProperties() {
//     return db
//         .collection("properties")
//         .where('hide', isEqualTo: false)
//         .where('isAccepted', isEqualTo: 2)
//         .where("category", isEqualTo: categoryFilter)
//         .where("type", isEqualTo: typeFilter)
//         .where('constructionStatus', isEqualTo: constructionStatusFilter)
//         .where('listedBy', isEqualTo: listedByFilter)
//         .where('floors', isEqualTo: floorsFilter)
//         .where('bedrooms', isEqualTo: bedFilter)
//         .where('bathrooms', isEqualTo: bathFilter)
//         .where('furnishing', isEqualTo: furnishingFilter)
//         .snapshots();
//   }

//   getRecentProperties() {
//     return db
//         .collection("properties")
//         .where('hide', isEqualTo: false)
//         .where('isAccepted', isEqualTo: 2)
//         .orderBy('timestamp', descending: true)
//         .snapshots();
//   }

//   addPropertyDetails({
//     required String category,
//     required String? type,
//     required String title,
//     required String description,
//     required String price,
//     required Map<String, String> location,
//     required List<String> imageUrls,
//     required String? listedBy,
//     required String facingDirection,
//     required String length,
//     required String breadth,
//     required String? furnishing,
//     required String? constructionStatus,
//     required String? carParking,
//     required String? bedrooms,
//     required String? bathrooms,
//     required String areaftsq,
//     required String? floors,
//     required String plotArea,
//     required String postedBy,
//     required String postedFrom,
//     required List<String> propertySaved,
//   }) {
//     if (type == null ||
//         title == "" ||
//         description == "" ||
//         price == "" ||
//         listedBy == null ||
//         facingDirection == "select direction" ||
//         location['country'] == "" ||
//         location["state"] == "null" ||
//         location["city"] == "null") {
//       errorSnackBar("Error", "fill all fields");
//       return;
//     }

//     if (category == 'House' || category == 'Apartment') {
//       if (furnishing == null ||
//           constructionStatus == null ||
//           carParking == null ||
//           bedrooms == null ||
//           bathrooms == null ||
//           floors == null ||
//           areaftsq == "") {
//         errorSnackBar(
//           "Error",
//           "fill all fields",
//         );
//         return;
//       }
//       PropertyHouseAndApartmentModel property = PropertyHouseAndApartmentModel(
//         id: db.collection('properties').doc().id,
//         userId: auth.currentUser!.uid,
//         type: type,
//         title: title,
//         description: description,
//         price: price,
//         location: location,
//         imageUrls: imageUrls,
//         listedBy: listedBy,
//         facingDirection: facingDirection,
//         furnishing: furnishing,
//         constructionStatus: constructionStatus,
//         carParking: carParking,
//         bedrooms: bedrooms,
//         bathrooms: bathrooms,
//         areaftsq: areaftsq,
//         floors: floors,
//         postedBy: postedBy,
//         userImg: null,
//         postedFrom: postedFrom,
//         category: category,
//         propertySaved: propertySaved,
//         hide: false,
//         isAccepted: 0,
//         isSold: true,
//       );
//       if (imageUrls.length < 4) {
//         errorSnackBar("Error", "Minimum 4 images required");
//         return;
//       }
//       db.collection('properties').add(property.toMap());
//       successSnackbar("Success", "Request  has been sent successfully!");
//       indexCtrl.index.value = 2;
//       Get.offAll(BottomNavBar());
//     } else if (category == 'Land') {
//       if (plotArea == "" || length == "" || breadth == "") {
//         errorSnackBar("Error", "fill all fields");
//         return;
//       }
//       if (imageUrls.length < 4) {
//         errorSnackBar("Error", "Minimum 4 images required");
//         return;
//       }
//       PropertyLandModel property = PropertyLandModel(
//         id: db.collection('properties').doc().id,
//         userId: auth.currentUser!.uid,
//         type: type,
//         title: title,
//         description: description,
//         price: price,
//         location: location,
//         imageUrls: imageUrls,
//         listedBy: listedBy,
//         facingDirection: facingDirection,
//         length: length,
//         breadth: breadth,
//         userImg: null,
//         plotArea: plotArea,
//         postedBy: postedBy,
//         postedFrom: postedFrom,
//         category: category,
//         propertySaved: propertySaved,
//         hide: false,
//         isAccepted: 0,
//         isSold: true,
//       );

//       db.collection('properties').add(property.toMap());
//       successSnackbar("Success", "Request  has been sent successfully!");
//       indexCtrl.index.value = 2;
//       Get.offAll(BottomNavBar());
//     } else {
//       errorSnackBar("error", "select category");
//     }
//   }

//   deleteProperty(String propertyId) async {
//     try {
//       await db.collection('properties').doc(propertyId).delete();
//       successSnackbar("Success", "Property deleted successfully");
//     } catch (e) {
//       errorSnackBar("Error", "Failed to delete property: $e");
//     }
//   }

//   uploadImageToFirebase(File imageFile) async {
//     try {
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child("images")
//           .child("${DateTime.now().millisecondsSinceEpoch}");
//       isLoading.value = true;
//       final result = await ref.putFile(imageFile);
//       final fileUrl = await result.ref.getDownloadURL();
//       imageUrls.add(fileUrl);
//       isLoading.value = false;
//       successSnackbar(
//           "Success", 'Image ${imageUrls.length} successfully saved');
//     } catch (e) {
//       errorSnackBar("error", 'Error in uploading image $e');
//     }
//   }

//   getUserLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

//     if (!serviceEnabled) {
//       errorSnackBar("Error", "Location service is not enabled");
//     }

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         errorSnackBar("Error", "Location permission denied");
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       errorSnackBar("Error", "Location permissions are permanently denied");
//     }
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);

//     List<Placemark> placemarks =
//         await placemarkFromCoordinates(position.latitude, position.longitude);

//     location["country"] = placemarks.first.country.toString();
//     location["state"] = placemarks.first.administrativeArea.toString();
//     location["city"] =
//         "${placemarks.first.subLocality}, ${placemarks.first.locality}";
//     update();
//   }

//   getDataForEdit([bool? isLand]) {
//     title.text = dataForEdit['title'];
//     description.text = dataForEdit['description'];
//     price.text = dataForEdit['price'];
//     facingDirection = dataForEdit['facingDirection'];
//     location['country'] = dataForEdit['location']['country'];
//     location['state'] = dataForEdit['location']['state'];
//     location['city'] = dataForEdit['location']['city'];
//     for (var img in dataForEdit['imageUrls']) {
//       imageUrls.add(img);
//     }
//     category = dataForEdit['category'];
//     type = dataForEdit['type'];
//     listedBy = dataForEdit['listedBy'];
//     if (isLand!) {
//       plotArea.text = dataForEdit['plotArea'];
//       length.text = dataForEdit['length'];
//       breadth.text = dataForEdit['breadth'];
//     } else {
//       areaftsq.text = dataForEdit['areaftsq'];
//       furnishing = dataForEdit['furnishing'];
//       constructionStatus = dataForEdit['constructionStatus'];
//       carParking = dataForEdit['carParking'];
//       bedrooms = dataForEdit['bedrooms'];
//       bathrooms = dataForEdit['bathrooms'];
//       floors = dataForEdit['floors'];
//     }
//   }

//   editProperty() async {
//     if (type == null ||
//         title.text == "" ||
//         description.text == "" ||
//         price.text == "" ||
//         listedBy == null ||
//         facingDirection == "select direction" ||
//         location['country'] == "" ||
//         location["state"] == "null" ||
//         location["city"] == "null") {
//       errorSnackBar("Error", "fill all fields");
//       return;
//     }

//     try {
//       Map<String, dynamic> updatedDetails;
//       if (category == "Land") {
//         if (plotArea.text == "" || length.text == "" || breadth.text == "") {
//           errorSnackBar("Error", "fill all fields");
//           return;
//         }
//         if (imageUrls.length < 4) {
//           errorSnackBar("Error", "Minimum 4 images required");
//           return;
//         }
//         updatedDetails = {
//           'type': type,
//           'breadth': breadth.text,
//           'category': category,
//           'description': description.text,
//           'facingDirection': facingDirection,
//           'imageUrls': imageUrls,
//           'length': length.text,
//           'title': title.text,
//           'price': price.text,
//           'location': location,
//           'listedBy': listedBy,
//           'plotArea': plotArea.text,
//           'postedBy': postedBy,
//           'postedFrom': postedFrom,
//         };
//       } else {
//         if (furnishing == null ||
//             constructionStatus == null ||
//             carParking == null ||
//             bedrooms == null ||
//             bathrooms == null ||
//             floors == null ||
//             areaftsq.text == "") {
//           errorSnackBar("Error", "fill all fields");
//           return;
//         }

//         if (imageUrls.length < 4) {
//           errorSnackBar("Error", "Minimum 4 images required");
//           return;
//         }
//         updatedDetails = {
//           'type': type,
//           'category': category,
//           'description': description.text,
//           'facingDirection': facingDirection,
//           'imageUrls': imageUrls,
//           'title': title.text,
//           'price': price.text,
//           'location': location,
//           'listedBy': listedBy,
//           'postedBy': postedBy,
//           'postedFrom': postedFrom,
//           'furnishing': furnishing,
//           'constructionStatus': constructionStatus,
//           'carParking': carParking,
//           'areaftsq': areaftsq.text,
//           'floors': floors,
//           'bedrooms': bedrooms,
//           'bathrooms': bathrooms,
//         };
//       }
//       await db.collection('properties').doc(propertyId).update(updatedDetails);
//       successSnackbar("Success", "Property details updated successfully");
//       Get.off(() => const MyPropertiesPage());

//       editMode = false;
//       PropertyController.propertyId = null;
//     } catch (e) {
//       errorSnackBar("Error", "Failed to update property details: $e");
//     }
//   }

//   savedProperties(String property, bool toAdd) async {
//     if (toAdd) {
//       await db.collection('properties').doc(property).update({
//         'propertySaved': FieldValue.arrayUnion([auth.currentUser!.uid])
//       });
//     } else {
//       await db.collection('properties').doc(property).update({
//         'propertySaved': FieldValue.arrayRemove([auth.currentUser!.uid])
//       });
//     }
//   }

//   setSoldorNot(String propId, bool isSold) async {
//     await db.collection('properties').doc(propId).update({
//       'isSold': isSold,
//     });
//   }
// }