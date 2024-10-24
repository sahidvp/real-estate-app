import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

Padding propertyFeciliities(double sw, List fecility) {
  return Padding(
    padding: EdgeInsets.only(left: 22),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(fecility.length, (index) {
        String result = fecility[index].replaceAll(" ", "").toLowerCase();
        return Container(
          width: sw * .20,
          height: sw * .2,
          decoration: BoxDecoration(
              boxShadow: [AppDecoration.boxShadow],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: SvgPicture.asset("asset/icons/$result.svg")),
              Flexible(
                  child: Text(
                fecility[index],
                style: AppTextStyles.locationtext,
              ))
            ],
          ),
        );
      }),
    ),
  );
}
