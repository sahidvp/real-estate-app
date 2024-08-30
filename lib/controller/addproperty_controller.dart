import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddpropertyController extends GetxController {
  var selectedIndex1 = 0.obs;
  var selectedIndex2 = 0.obs;
  var selectedPropertyType = ''.obs;
  var selectedFurnishing = Rx<String?>(null);
  var selectedConstructionStatus = Rx<String?>(null);
  var bedroomCount = 0.obs;
  var bathroomCount = 0.obs;
  var balconyCount = 0.obs;
  var carparkingCount = 0.obs;
  final TextEditingController builtupArea = TextEditingController();
  final TextEditingController projectName = TextEditingController();
  final TextEditingController adTittle = TextEditingController();

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
}
