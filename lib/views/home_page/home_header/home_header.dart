import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/controller/map_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_filter.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_homesearch.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_location.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_userimage.dart';
import 'package:real_estate/views/property_view/all_property.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.sb,
  });

  final double sb;

  @override
  Widget build(BuildContext context) {
    MapController mapcntrl = Get.put(MapController());
    AuthController cntrl = Get.put(AuthController());
    AddpropertyController pCntrl = Get.put(AddpropertyController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sb * .3),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildLocation(sb, mapcntrl),
                buildUserimage(cntrl, sb)
              ],
            ),
            SizedBox(
              height: sb * .2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildHomesearch(sb, pCntrl),
                buildFilter(sb, pCntrl.filterCount.value)
              ],
            )
          ],
        ),
      ),
    );
  }
}
