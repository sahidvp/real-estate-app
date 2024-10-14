// import 'package:flutter/material.dart';

// import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';

// class PropertyList extends StatelessWidget {
//   const PropertyList({super.key, required this.sb, required this.properties});

//   final double sb;
//   final List properties;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: properties.length,
//      itemBuilder: (context, i) {
//         final property = properties[i];
//         return propertyTag(sb, property); // Pass each property to the widget
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';

class PropertyList extends StatelessWidget {
  const PropertyList({super.key, required this.sb, required this.properties});

  final double sb;
  final List properties;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: properties.length, // Show all properties from the list
      itemBuilder: (context, i) {
        final property = properties[i];
        return propertyTag(sb, property); // Pass each property to the widget
      },
    );
  }
}
