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
import 'package:real_estate/views/userprofile/screens/my_properties/my_properties.dart';
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
  static bool editMode = false;
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
  static dynamic dataForEdit;
  static String? propId;

  String postedBy = "";
  String postedFrom = "";
  var properties = <dynamic>[].obs;
  var filteredProperties = [].obs;
  var recentProperties = <dynamic>[].obs;
  var nearbyProperties = <dynamic>[].obs;
  var favProperties = <dynamic>[].obs;
  var myProperties = <dynamic>[].obs;

  var categoryFilter = 0.obs;
  var listedbyFilter = 0.obs;
  var typeFilter = 0.obs;
  var filterIndex = 0.obs;
  var filterCount = 0.obs;
  int? startingRange;
  int? endingRange;
  TextEditingController minAmount = TextEditingController();
  TextEditingController maxAmount = TextEditingController();

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
    fetchRecentProperties();
  }

  void clearFields() {
    selectedIndex1.value = -1;
    selectedIndex2.value = -1;
    adTittle.clear();
    description.clear();
    price.clear();
    projectName.clear();
    builtupArea.clear();
    length.clear();
    breadth.clear();
    location.clear();
    imageUrls.clear();
    type = null;
    listedBy = null;
    category = '';
    furnishing = null;
    constructionStatus = null;
    carparkingCount.value = 0;
    bedroomCount.value = 0;
    bathroomCount.value = 0;
    floorCount.value = 0;
    selectedIndices.clear();
    // environment.clear();
  }

  getDataForEdit([bool? isLand]) {
    dataForEdit.transactionType == "Sale"
        ? selectedIndex1.value = 0
        : selectedIndex1.value = 1;

    adTittle.text = dataForEdit.title;
    description.text = dataForEdit.description;
    price.text = dataForEdit.price;
    projectName.text = dataForEdit.projectName;

    location['country'] = dataForEdit.location['country'];
    location['state'] = dataForEdit.location['state'];
    location['city'] = dataForEdit.location['city'];
    builtupArea.text = dataForEdit.areasqft;

    for (var img in dataForEdit.imageUrls) {
      imageUrls.add(img);
    }

    type = dataForEdit.transactionType;
    listedBy = dataForEdit.listedBy;
    if (isLand!) {
      length.text = dataForEdit.length;
      breadth.text = dataForEdit.breadth;
    } else {
      selectedIndex2.value = PropertyModel.type.indexOf(dataForEdit.category);
      category = dataForEdit.category;
      environment = dataForEdit.environment;

      furnishing = dataForEdit.furnishing;
      constructionStatus = dataForEdit.constructionStatus;
      carparkingCount.value = int.parse(dataForEdit.carParking);
      bedroomCount.value = int.parse(dataForEdit.bedrooms);
      bathroomCount.value = int.parse(dataForEdit.bathrooms);
      floorCount.value = int.parse(dataForEdit.floors);
      for (var env in dataForEdit.environment) {
        selectedIndices.add(PropertyModel.enviornment.indexOf(env));
      }
    }
  }

  editProperty() async {
    if (type == null ||
        adTittle.text == "" ||
        description.text == "" ||
        price.text == "" ||
        listedBy == null ||
        location['country'] == "" ||
        location["state"] == "null" ||
        location["city"] == "null") {
      errorSnackBar(message: "fill all fields");
      return;
    }

    try {
      Map<String, dynamic> updatedDetails;
      if (category == "Land") {
        if (builtupArea.text == "" || length.text == "" || breadth.text == "") {
          errorSnackBar(message: "fill all fields");
          return;
        }
        if (imageUrls.length < 4) {
          errorSnackBar(message: "Minimum 4 images required");
          return;
        }
        updatedDetails = {
          'transactionType': type,
          'breadth': breadth.text,
          'category': category,
          'description': description.text,
          'imageUrls': imageUrls,
          'length': length.text,
          'title': adTittle.text,
          'price': price.text,
          'location': location,
          'listedBy': listedBy,
          'areasqft': builtupArea.text,
          'postedBy': auth.currentUser?.displayName,
          'postedFrom': postedFrom,
          'projectName': projectName.text
        };
      } else {
        if (furnishing == null ||
            constructionStatus == null ||
            carparkingCount.value == 0 ||
            bedroomCount.value == 0 ||
            bathroomCount.value == 0 ||
            floorCount.value == 0 ||
            builtupArea.text == "") {
          errorSnackBar(
            message: "fill all fields",
          );
          return;
        }

        if (imageUrls.length < 4) {
          errorSnackBar(message: "Minimum 4 images required");
          return;
        }
        updatedDetails = {
          'transactionType': type,
          'category': category,
          'description': description.text,
          'imageUrls': imageUrls,
          'title': adTittle.text,
          'price': price.text,
          'location': location,
          'listedBy': listedBy,
          'postedBy': auth.currentUser?.displayName,
          'postedFrom': postedFrom,
          'furnishing': furnishing,
          'constructionStatus': constructionStatus,
          'carParking': carparkingCount.toString(),
          'areasqft': builtupArea.text,
          'floors': floorCount.toString(),
          'bedrooms': bedroomCount.toString(),
          'bathrooms': bathroomCount.toString(),
          'environment': environment,
          'projectName': projectName.text
        };
      }
      CollectionReference properties = db.collection('properties');
      QuerySnapshot querySnapshot =
          await properties.where('id', isEqualTo: propId).get();
      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        await properties.doc(documentId).update(updatedDetails);
        onInit();
        fetchMyProperties();
      }
     // Get.back();
      Get.off(() => const MyProperties());

      editMode = false;
      AddpropertyController.propId = null;
    } catch (e) {
      errorSnackBar(message: "Failed to update property details: $e");
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
      Query query = db.collection('properties');

      if (categoryFilter.value != 0) {
        query = query.where('category',
            isEqualTo: PropertyModel.categoryFilter[categoryFilter.value]);
      }

      if (typeFilter.value != 0) {
        query = query.where('transactionType',
            isEqualTo: PropertyModel.typeFilter[typeFilter.value]);
      }

      if (listedbyFilter.value != 0) {
        query = query.where('listedBy',
            isEqualTo: PropertyModel.listedbyFilter[listedbyFilter.value]);
      }

      QuerySnapshot snapshot = await query.get();

      properties.clear();

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        if (startingRange != null && endingRange != null) {
          int price = int.parse(data['price']);
          if (price >= startingRange! && price <= endingRange!) {
            if (data['category'] == 'Land') {
              properties.add(LandListingModel.fromMap(data));
            } else {
              properties.add(PropertyListingModel.fromMap(
                  data)); // Adjust this for other property models
            }
          }
        } else {
          if (data['category'] == 'Land') {
            properties.add(LandListingModel.fromMap(data));
          } else {
            properties.add(PropertyListingModel.fromMap(
                data)); // Adjust this for other property models
          }
        }
      }
      fetchAndCheckProperties();
    } catch (e) {
      //
    } finally {
      isLoading.value = false;
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
        var data = doc.data() as Map<String, dynamic>;

        if (data['category'] == 'Land') {
          recentProperties.add(LandListingModel.fromMap(data));
        } else {
          recentProperties.add(PropertyListingModel.fromMap(data));
        }
        
      }
    } catch (e) {
    //
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
     //
    } finally {
      isLoading.value = false;
    }
  }

  /////////
  var savedStatus = <String, bool>{}.obs;

  Future<void> savedProperties(String propertyId, bool toAdd) async {
    final querySnapshot = await db
        .collection('properties')
        .where('id', isEqualTo: propertyId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final docId = querySnapshot.docs.first.id;

      if (toAdd) {
        await db.collection('properties').doc(docId).update({
          'propertySaved': FieldValue.arrayUnion([auth.currentUser!.uid])
        });
        savedStatus[propertyId] = true; // Update the saved status
      } else {
        await db.collection('properties').doc(docId).update({
          'propertySaved': FieldValue.arrayRemove([auth.currentUser!.uid])
        });
        savedStatus[propertyId] = false; // Update the saved status
      }
      successSnackbar("Success", toAdd ? "Property saved" : "Property removed");
      fetchSavedProperties(auth.currentUser!.uid);
    } else {
      
    }
    update();
  }

  void fetchAndCheckProperties() async {
    // Fetch properties and update saved status

    for (var property in properties) {
      checkSavedStatus(property.id, property.propertySaved);
    }
  }

  void checkSavedStatus(String propertyId, List<dynamic> propertySavedList) {
    savedStatus[propertyId] = propertySavedList.contains(auth.currentUser!.uid);
  }

  Future<void> fetchSavedProperties(String userId) async {
    try {
      // Fetch properties where 'propertySaved' array contains the current user's ID
      QuerySnapshot snapshot = await db
          .collection('properties')
          .where('propertySaved', arrayContains: userId)
          .get();

      favProperties.clear(); // Clear the current list of saved properties

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        if (data['category'] == 'Land') {
          favProperties.add(LandListingModel.fromMap(data));
        } else {
          favProperties.add(PropertyListingModel.fromMap(data));
        }
      }

      update(); // Notify listeners to rebuild the UI
    } catch (e) {
      //
    } finally {}
  }

  //dlelete
  void deleteProperty(String propertyId) async {
    try {
      // Query to find documents with the specified propertyId
      var querySnapshot = await db
          .collection('properties')
          .where('id', isEqualTo: propertyId)
          .get();

      // Loop through each document found and delete
      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      successSnackbar("Success", "Property deleted successfully");
      fetchRecentProperties();
      fetchNearbyProperties(location["city"]);
      fetchProperties();
      fetchSavedProperties(auth.currentUser!.uid);
      filteredProperties.value = properties;
      fetchMyProperties();

      // Optionally, remove from the local list as well
    } catch (e) {
      errorSnackBar(message: "Failed to delete property: $e");
    }
  }

  Future<void> fetchMyProperties() async {
    isLoading.value = true;

    try {
      // Query to get properties where the userId matches the current user
      Query query = db
          .collection('properties')
          .where('userId', isEqualTo: auth.currentUser!.uid);

      QuerySnapshot snapshot = await query.get();

      myProperties.clear(); // Clear the current user's properties list

      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;

        // Add the properties to myProperties list based on the category type
        if (data['category'] == 'Land') {
          myProperties.add(LandListingModel.fromMap(data));
        } else {
          myProperties.add(PropertyListingModel.fromMap(data));
        }
      }
    } catch (e) {
      //
    } finally {
      isLoading.value = false;
    }
  }

  void updateFilterCount() {
    int count = 0;
    if (startingRange != null && endingRange != null) count++;
    if (categoryFilter.value != 0) count++;
    if (typeFilter.value != 0) count++;
    if (listedbyFilter.value != 0) count++;

    filterCount.value = count;
  }

  void filterClear() {
    typeFilter.value = 0;
    categoryFilter.value = 0;
    listedbyFilter.value = 0;
    minAmount.clear();
    maxAmount.clear();
    startingRange = null;
    endingRange = null;
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
    fetchRecentProperties();
     fetchProperties();  
    
    fetchNearbyProperties(location["city"]);
   
    fetchSavedProperties(auth.currentUser!.uid);
    filteredProperties.value = properties;
    fetchMyProperties();

    super.onInit();
  }
}
