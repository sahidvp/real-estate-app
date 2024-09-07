import 'package:get/get.dart';

class MapController extends GetxController {
  var chooselocation = "choose location".obs;

    void updateLocation(String newLocation) {
    chooselocation.value = newLocation; // Updates the value
  }
}
