import 'package:flutter/material.dart';
import 'package:real_estate/model/propertlisting/property_model.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/home_page/home_body/home_body.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_filter.dart';
import 'package:real_estate/views/home_page/home_header/widget/build_homesearch.dart';

class AllProperty extends StatelessWidget {
  const AllProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .1);
    final sw = MediaQueryUtil.getWidthPercentage(context, .1);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sw * .5),
        child: Column(
          children: [
            SizedBox(
              height: sb,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildHomesearch(sb),
                //SizedBox(wi),
                buildFilter(sb)
              ],
            ),
            SizedBox(
              height: sb * .2,
            ),
            HomeBodyone(sb: sb, category: PropertyModel.category),
            //  ListView.builder(itemBuilder: (context,index)=>Container())
          ],
        ),
      ),
    );
  }
}
