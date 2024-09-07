// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';

// class GetCurrentLocationScreen extends StatefulWidget {
//   const GetCurrentLocationScreen({super.key});

//   @override
//   State<GetCurrentLocationScreen> createState() =>
//       _GetCurrentLocationScreenState();
// }

// class _GetCurrentLocationScreenState extends State<GetCurrentLocationScreen> {
//   late GoogleMapController googleMapController;

//   static const CameraPosition initialCameraPosition = CameraPosition(
//       target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

//   Set<Marker> markers = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Current Location"),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: initialCameraPosition,
//         markers: markers,
//         zoomControlsEnabled: false,
//         mapType: MapType.normal,
//         onMapCreated: (GoogleMapController controller) {
//           googleMapController = controller;
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           Position position = await _determinePosition();
//           googleMapController.animateCamera(CameraUpdate.newCameraPosition(
//               CameraPosition(
//                   target: LatLng(position.latitude, position.longitude),
//                   zoom: 14)));
//           markers.clear();
//           markers.add(Marker(
//               markerId: const MarkerId("currentLocation"),
//               position: LatLng(position.latitude, position.longitude)));
//           setState(() {});
//         },
//         label: const Text("Current Location"),
//         icon: const Icon(IconsaxPlusBold.location),
//       ),
//     );
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Open location settings if services are disabled
//       bool isLocationSettingsOpened = await Geolocator.openLocationSettings();
//       if (!isLocationSettingsOpened) {
//         return Future.error("Location services are disabled, and settings were not opened.");
//       }

//       // Check again if services were enabled after opening settings
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         return Future.error("Location services are still disabled.");
//       }
//     }

//     // Check if location permissions are granted
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied.");
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error("Location permission is permanently denied.");
//     }

//     // Get the current position
//     return await Geolocator.getCurrentPosition();
//   }
// }
//////////////////////////////////
///

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/controller/map_controller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/views/widgets/submitbutton.dart'; // For reverse geocoding

// class GetCurrentlocationScreen extends StatefulWidget {
//   const GetCurrentlocationScreen({super.key});

//   @override
//   State<GetCurrentlocationScreen> createState() =>
//       _GetCurrentlocationScreenState();
// }

// class _GetCurrentlocationScreenState extends State<GetCurrentlocationScreen> {
//   final AuthController cntrl = Get.find();
//   final MapController mCntrl = Get.put(MapController());
//   late GoogleMapController googleMapController;
//   static const CameraPosition initialcameraPosition = CameraPosition(
//       target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);
//   Set<Marker> markers = {};
//   String address = "Fetching address...";

//   // Define the location map to store country, state, and city
//   Map<String, String> location = {
//     "country": "",
//     "state": "",
//     "city": "",
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primary,
//         title: const Text("Current Location"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               initialCameraPosition: initialcameraPosition,
//               markers: markers,
//               zoomControlsEnabled: false,
//               mapType: MapType.normal,
//               onMapCreated: (GoogleMapController controller) {
//                 googleMapController = controller;
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               address,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: Text(
//           //     'City: ${location["city"]}, State: ${location["state"]}, Country: ${location["country"]}',
//           //     style: const TextStyle(fontSize: 16),
//           //   ),
//           // ),
//           SubmitButton(
//               controller: cntrl,
//               buttonname: "Finish",
//               onPressed: () => Get.back())
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 150),
//         child: FloatingActionButton(
//           backgroundColor: Colors.white,
//           child: Icon(IconsaxPlusBold.gps),
//           onPressed: () async {
//             Position position = await _determinePosition();

//             // Move the camera to the user's current position
//             googleMapController.animateCamera(CameraUpdate.newCameraPosition(
//                 CameraPosition(
//                     target: LatLng(position.latitude, position.longitude),
//                     zoom: 14)));

//             // Clear previous markers and add a marker to the current position
//             markers.clear();
//             markers.add(Marker(
//                 draggable: true,
//                 markerId: const MarkerId("currentLocation"),
//                 position: LatLng(position.latitude, position.longitude)));

//             // Perform reverse geocoding to get address details
//             List<Placemark> placemarks = await placemarkFromCoordinates(
//                 position.latitude, position.longitude);

//             Placemark place = placemarks[0];

//             // Update the address variable
//             setState(() {
//               address =
//                   "${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";

//               mCntrl.updateLocation(
//                   "${place.locality},${place.administrativeArea}");

//               // Store city, state, and country in the location map
//               location["country"] = place.country ?? "";
//               location["state"] = place.administrativeArea ?? "";
//               location["city"] = place.locality ?? "";
//             });
//           },
//           // label: const Text("Get Current Location"),
//           //  icon: const Icon(IconsaxPlusBold.location),
//         ),
//       ),
//     );
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Check if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Open location settings if services are disabled
//       bool isLocationSettingsOpened = await Geolocator.openLocationSettings();
//       if (!isLocationSettingsOpened) {
//         return Future.error(
//             "Location services are disabled, and settings were not opened.");
//       }

//       // Check again if services were enabled after opening settings
//       serviceEnabled = await Geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         return Future.error("Location services are still disabled.");
//       }
//     }

//     // Check if location permissions are granted
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied.");
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error("Location permission is permanently denied.");
//     }

//     // Get the current position
//     return await Geolocator.getCurrentPosition();
//   }
// }

///////////

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:geocoding/geocoding.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/controller/map_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/widgets/submitbutton.dart';

class GetCurrentlocationScreen extends StatefulWidget {
  final bool isHomeScreen;
  const GetCurrentlocationScreen({super.key,required this.isHomeScreen});

  @override
  State<GetCurrentlocationScreen> createState() =>
      _GetCurrentlocationScreenState();
}

class _GetCurrentlocationScreenState extends State<GetCurrentlocationScreen> {
  final AuthController cntrl = Get.find();
  final MapController mCntrl = Get.put(MapController());
  final AddpropertyController pCntrl = Get.put(AddpropertyController());
  late GoogleMapController googleMapController;

  static const CameraPosition initialcameraPosition = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14);

  Set<Marker> markers = {};
  String address = "Fetching address...";

  // Location map to store country, state, and city
  Map<String, String> location = {
    "country": "",
    "state": "",
    "city": "",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text("Current Location"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: initialcameraPosition,
              markers: markers,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              address,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SubmitButton(
            controller: cntrl,
            buttonname: "Finish",
            onPressed: () => Get.back(),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 150),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(IconsaxPlusBold.gps),
          onPressed: () async {
            Position position = await _determinePosition();

            // Move the camera to the user's current position
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));

            // Clear previous markers and add a new draggable marker
            markers.clear();
            markers.add(Marker(
              draggable: true,
              markerId: const MarkerId("currentLocation"),
              position: LatLng(position.latitude, position.longitude),
              onDragEnd: (newPosition) async {
                // Update address when marker is dragged to new position
                await _updateAddress(
                    newPosition.latitude, newPosition.longitude,widget.isHomeScreen);
              },
            ));

            // Perform reverse geocoding to get address details for the initial position
            await _updateAddress(position.latitude, position.longitude,widget.isHomeScreen);

            setState(() {});
          },
        ),
      ),
    );
  }

  // Update address based on coordinates
  Future<void> _updateAddress(double latitude, double longitude,bool isHomeScreen) async {
    try {
      // Reverse geocoding to get placemarks
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];

      // Update address and location details
      setState(() {
        address =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
        // "${place.street}, ${place.locality},${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";

      if(isHomeScreen)  mCntrl.updateLocation("${place.subLocality}, ${place.locality}");

        // Store city, state, and country in the location map
        pCntrl.location["country"] = place.country ?? "";
        pCntrl.location["state"] = place.administrativeArea ?? "";
        pCntrl.location["city"] = place.locality ?? "";
        pCntrl.update();
      });
    } catch (e) {
      setState(() {
        address = "Could not fetch address. Try again.";
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      bool isLocationSettingsOpened = await Geolocator.openLocationSettings();
      if (!isLocationSettingsOpened) {
        return Future.error(
            "Location services are disabled, and settings were not opened.");
      }

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error("Location services are still disabled.");
      }
    }

    // Check if location permissions are granted
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission is permanently denied.");
    }

    // Get the current position
    return await Geolocator.getCurrentPosition();
  }
}
