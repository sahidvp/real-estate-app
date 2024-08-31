import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/media_query.dart';
import 'package:real_estate/views/listing_property/widgets/build_cscpicker.dart';
import 'package:real_estate/views/listing_property/widgets/build_currebtlocation.dart';

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final sb = MediaQueryUtil.getHeightPercentage(context, .05);
    AddpropertyController propertyCntr = Get.put(AddpropertyController());
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: sb * .5),
          Divider(),
          SizedBox(height: sb * .5),
          buildCscpicker(propertyCntr),
          SizedBox(height: sb * .5),
          Align(
            alignment: Alignment.center,
            child: Text(
              "OR",
              style: AppTextStyles.subHeading,
            ),
          ),
          SizedBox(height: sb * .5),
          buildCurrentlocation(propertyCntr, sb),
          SizedBox(height: sb * .5),
          GetBuilder<AddpropertyController>(builder: (controller) {
            return propertyCntr.location["city"] == null
                ? const SizedBox(height: 0)
                : Text(
                    "${propertyCntr.location["city"]} ,${propertyCntr.location["state"]} ,${propertyCntr.location["country"]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: AppColors.primary),
                  );
          })
        ],
      ),
    );
  }
}
