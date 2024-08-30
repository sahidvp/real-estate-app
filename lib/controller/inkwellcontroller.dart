// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/addproperty_controller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/media_query.dart';

// class AddPropertyscreen extends StatelessWidget {
//   const AddPropertyscreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final AddpropertyController propertyCntr = Get.put(AddpropertyController());
//     List<String> list = ["House", "Apartments", "Villas"];
//     final sb = MediaQueryUtil.getHeightPercentage(context, .05);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text('Add Property', style: TextStyle(color: Colors.black)),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: sb * .5),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: sb * .8),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: sb),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: ToggleButton(
//                         text: "Sale",
//                         index: 0,
//                         selectedIndex: propertyCntr.selectedIndex1,
//                       ),
//                     ),
//                     Expanded(
//                       child: ToggleButton(
//                         text: "Rent",
//                         index: 1,
//                         selectedIndex: propertyCntr.selectedIndex1,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: sb * .5),
//               const Text("Type", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//               SizedBox(height: sb * .5),
//               Obx(() => DropdownButton<String>(
//                     value: propertyCntr.selectedPropertyType.value.isEmpty
//                         ? null
//                         : propertyCntr.selectedPropertyType.value,
//                     hint: const Text("Select Property Type"),
//                     onChanged: (String? newValue) {
//                       if (newValue != null) {
//                         propertyCntr.selectPropertyType(newValue);
//                       }
//                     },
//                     items: list.map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   )),
//               SizedBox(height: sb * .5),
//               const Text("Property Features", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//               // Add your other widgets here...
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
