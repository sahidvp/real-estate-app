import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/bottomnav_controller.dart';
import 'package:real_estate/model/propertlisting/property_landmodel.dart';
import 'package:real_estate/model/propertlisting/property_listingmodel.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/views/bottom_navbar/bottom_nav.dart';
import 'package:real_estate/views/widgets/snackbar/errorsnckbar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

class AddpropertyController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  var selectedIndex1 = 100.obs;
  var selectedIndex2 = 100.obs;
  var selectedPropertyType = ''.obs;
  var selectedFurnishing = Rx<String?>(null);
  var selectedConstructionStatus = Rx<String?>(null);
  var selectedlistedby = Rx<String?>(null);
  var bedroomCount = 0.obs;
  var bathroomCount = 0.obs;
  final indexCtrl = Get.put(BottomNavController());
  var carparkingCount = 0.obs;
  var floorCount = 0.obs;
  RxList<int> selectedIndices = <int>[].obs;
  Map<String, String> location = {
    "country": "",
    "state": "",
    "city": "",
  };
  List<String> imageUrls = [];
  List<String> environment = [];
  List<String> propertySaved = [];
  final isLoading = false.obs;
  String category = '';
  String? type;
  String? listedBy;
  String? furnishing;
  String? constructionStatus;
  final TextEditingController builtupArea = TextEditingController();
  final TextEditingController projectName = TextEditingController();
  final TextEditingController adTittle = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController length = TextEditingController();
  final TextEditingController breadth = TextEditingController();
  String postedBy = "";
  String postedFrom = "";
  var properties = <dynamic>[].obs;
  var filteredProperties = [].obs;
  var recentProperties = <dynamic>[].obs;
  var nearbyProperties = <dynamic>[].obs;
  // Loading state

  void updateLocation(String key, String value) {
    location[key] = value;
    update(); // Force update if necessary
  }

  void selectButton1(int index) {
    selectedIndex1.value = index;
  }

  void selectButton2(int index) {
    selectedIndex2.value = index;
  }

  void selectPropertyType(String type) {
    selectedPropertyType.value = type;
  }

  void selectFurnishing(String value) {
    selectedFurnishing.value = value;
    furnishing = value;
  }

  void selectConstructionStatus(String value) {
    selectedConstructionStatus.value = value;
    constructionStatus = value;
  }

  void selectlistby(String value) {
    selectedlistedby.value = value;
    listedBy = value;
  }

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index); // Deselect if already selected
      environment.remove(PropertyModel.enviornment[index]);
    } else {
      selectedIndices.add(index); // Select the index
      environment.add(PropertyModel.enviornment[index]);
    }
  }

  addPropertyDetails({
    required String category,
    required String? transactionType,
    required String title,
    required String description,
    required String price,
    required Map<String, String> location,
    required List<String> imageUrls,
    required List<String> environment,
    required String? listedBy,
    required String length,
    required String breadth,
    required String? furnishing,
    required String? constructionStatus,
    required String carParking,
    required String bedrooms,
    required String bathrooms,
    required String projectname,
    required String areaftsq,
    required String floors,
    required String postedBy,
    required String postedFrom,
    required String? userImg,
    required List<String> propertySaved,
  }) {
    if (transactionType == null ||
        title == "" ||
        projectname == "" ||
        description == "" ||
        price == "" ||
        listedBy == null ||
        location['country'] == "" ||
        location["state"] == "null" ||
        location["city"] == "null") {
      errorSnackBar(message: "fill all fields");
      return;
    }

    if (category == 'House' || category == 'Apartment' || category == 'Villa') {
      if (furnishing == null ||
          constructionStatus == null ||
          carParking == "0" ||
          bedrooms == "0" ||
          bathrooms == "0" ||
          floors == "0" ||
          areaftsq == "") {
        errorSnackBar(
          message: "fill all fields",
        );
        return;
      }
      PropertyListingModel property = PropertyListingModel(
        id: db.collection('properties').doc().id,
        transactionType: transactionType,
        propertyType: category,
        title: title,
        description: description,
        price: price,
        location: location,
        imageUrls: imageUrls,
        bedrooms: bedrooms,
        bathrooms: bathrooms,
        carParking: carParking,
        floors: floors,
        furnishing: furnishing,
        constructionStatus: constructionStatus,
        environment: environment, // Add environment data if available
        listedBy: listedBy,
        projectName: projectname, // Replace with actual project name if needed
        postedBy: postedBy,
        userImg: userImg,
        areasqft: areaftsq,
        postedFrom: postedFrom,
        category: category,
        userId: auth.currentUser!.uid,
        propertySaved: propertySaved,
        hide: false,
        isSold: false,
      );

      if (imageUrls.length < 4) {
        errorSnackBar(message: "Minimum 4 images required");
        return;
      }
      db.collection('properties').add(property.toMap());
      successSnackbar("Success", "Request has been sent successfully!");
      indexCtrl.selectedIndex.value = 0;
      Get.offAll(BottomNavbar());
    } else if (category == 'Land') {
      if (areaftsq == "" || length == "" || breadth == "") {
        errorSnackBar(message: "fill all fields");
        return;
      }
      if (imageUrls.length < 4) {
        errorSnackBar(message: "Minimum 4 images required");
        return;
      }
      LandListingModel property = LandListingModel(
        id: db.collection('properties').doc().id,
        transactionType: transactionType,
        title: title,
        description: description,
        price: price,
        length: length,
        breadth: breadth,
        location: location,
        imageUrls: imageUrls,
        listedBy: listedBy,
        projectName: projectname, // Replace with actual project name if needed
        postedBy: postedBy,
        userImg: userImg,
        areasqft: areaftsq,
        postedFrom: postedFrom,
        category: category,
        userId: auth.currentUser!.uid,
        propertySaved: propertySaved,
        hide: false,
        isSold: false,
      );

      db.collection('properties').add(property.toMap());
      successSnackbar("Success", "Request has been sent successfully!");
      indexCtrl.selectedIndex.value = 0;
      Get.offAll(BottomNavbar());
    } else {
      errorSnackBar(message: "select category");
    }
  }

  getUserLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      errorSnackBar(message: "Location service is not enabled");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        errorSnackBar(message: "Location permission denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      errorSnackBar(message: "Location permissions are permanently denied");
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    location["country"] = placemarks.first.country.toString();
    location["state"] = placemarks.first.administrativeArea.toString();
    location["city"] = placemarks.first.locality.toString();

    update();
  }

  uploadImageToFirebase(File imageFile) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child("images")
          .child("${DateTime.now().millisecondsSinceEpoch}");
      isLoading.value = true;
      final result = await ref.putFile(imageFile);
      final fileUrl = await result.ref.getDownloadURL();
      imageUrls.add(fileUrl);
      isLoading.value = false;
      successSnackbar(
          "Success", 'Image ${imageUrls.length} successfully saved');
    } catch (e) {
      errorSnackBar(message: 'Error in uploading image $e');
    }
  }

  Future<void> fetchProperties() async {
    isLoading.value = true; // Set loading to true

    try {
      QuerySnapshot snapshot = await db.collection('properties').get();
      //  print(snapshot.docs);

      properties.clear(); // Clear the current list of properties

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        // Create the appropriate model based on the category
        if (data['category'] == 'Land') {
          properties.add(LandListingModel.fromMap(data));
        } else {
          properties.add(PropertyListingModel.fromMap(
              data)); // Adjust for your other property models
        }
      }
    } catch (e) {
      print("Error fetching properties: $e");
    } finally {
      isLoading.value = false; // Set loading to false after fetching
    }
  }

  Future<void> fetchRecentProperties() async {
    isLoading.value = true;
    try {
      QuerySnapshot snapshot = await db
          .collection('properties')
          .orderBy('timestamp', descending: true) // Sort by creation time
          .limit(5)
          .get();

      recentProperties.clear(); // Clear the current list of recent properties

      for (var doc in snapshot.docs) {
        print("snapshot doc");
        var data = doc.data() as Map<String, dynamic>;

        if (data['category'] == 'Land') {
          recentProperties.add(LandListingModel.fromMap(data));
        } else {
          recentProperties.add(PropertyListingModel.fromMap(data));
        }
        print("length of recent prorp${recentProperties.length}");
      }
    } catch (e) {
      print("Error fetching recent properties: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchNearbyProperties(String? userCity) async {
    //  isLoading.value = true;
    try {
      QuerySnapshot snapshot = await db
          .collection('properties')
          .where('location.city', isEqualTo: userCity)
          .get();

      nearbyProperties.clear(); // Clear the current list of nearby properties

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        if (data['category'] == 'Land') {
          nearbyProperties.add(LandListingModel.fromMap(data));
        } else {
          nearbyProperties.add(PropertyListingModel.fromMap(data));
        }
        update();
      }
    } catch (e) {
      print("Error fetching nearby properties: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void filterProperties(String query) {
    if (query.isEmpty) {
      filteredProperties.value = properties; // Reset to all if no query
    } else {
      filteredProperties.value = properties
          .where((property) => property.title
              .toLowerCase()
              .contains(query.toLowerCase())) // Filter properties
          .toList();
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit

    fetchRecentProperties();
    fetchNearbyProperties(location["city"]);
    fetchProperties();
    filteredProperties.value = properties;
    super.onInit();
  }
}
