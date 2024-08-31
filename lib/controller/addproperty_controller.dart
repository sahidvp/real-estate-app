import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:real_estate/views/widgets/snackbar/errorsnckbar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

class AddpropertyController extends GetxController {
  var selectedIndex1 = 0.obs;
  var selectedIndex2 = 0.obs;
  var selectedPropertyType = ''.obs;
  var selectedFurnishing = Rx<String?>(null);
  var selectedConstructionStatus = Rx<String?>(null);
  var selectedlistedby = Rx<String?>(null);
  var bedroomCount = 0.obs;
  var bathroomCount = 0.obs;
  
  var carparkingCount = 0.obs;
   var floorCount = 0.obs;
  RxList<int> selectedIndices = <int>[].obs;
  Map<String, String> location = {
    "country": "",
    "state": "",
    "city": "",
  };
  List<String> imageUrls = [];
  final isLoading = false.obs;

  final TextEditingController builtupArea = TextEditingController();
  final TextEditingController projectName = TextEditingController();
  final TextEditingController adTittle = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();

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
  }

  void selectConstructionStatus(String value) {
    selectedConstructionStatus.value = value;
  }

    void selectlistby(String value) {
    selectedlistedby.value = value;
  }

  void toggleSelection(int index) {
    if (selectedIndices.contains(index)) {
      selectedIndices.remove(index); // Deselect if already selected
    } else {
      selectedIndices.add(index); // Select the index
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
    location["city"] =
        "${placemarks.first.subLocality}, ${placemarks.first.locality}";
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
}
