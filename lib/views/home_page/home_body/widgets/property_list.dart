import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/home_page/home_body/widgets/build_propertytag.dart';

class PropertyList extends StatelessWidget {
  const PropertyList({
    super.key,
    required this.sb,
  });

  final double sb;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, i) => propertyTag(sb),
    );
  }
}
