import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/listing_property/addproperty_screen.dart';

Container editRemove(double sw, String action, dynamic property) {
  AddpropertyController controller = Get.find();
  bool isEdit = action == "Edit";

  return Container(
    decoration: BoxDecoration(
      boxShadow: [AppDecoration.boxShadow],
      borderRadius: BorderRadius.circular(10),
      border: Border.all(),
      color: Colors.white,
    ),
    width: sw * .3,
    child: TextButton(
      onPressed: () {
        if (isEdit) {
          AddpropertyController.dataForEdit = property;
          AddpropertyController.editMode = true;
          AddpropertyController.propId = property.id;

          if (property.category == 'Land') {
            controller.getDataForEdit(true);
            Get.to(() => AddPropertyscreen(isLand: true));
          } else {
            controller.getDataForEdit(false);
            Get.to(() => AddPropertyscreen(isLand: false));
          }
        } else {
          showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return removelDialog(context, controller, property);
            },
          );
        }
      },
      child: Text(
        action,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isEdit ? AppColors.primary : Colors.red,
        ),
      ),
    ),
  );
}

AlertDialog removelDialog(
    BuildContext context, AddpropertyController controller, property) {
  return AlertDialog(
    title: const Text("Confirm Removal"),
    content: const Text("Are you sure you want to remove this property?"),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(), // Dismiss the dialog
        child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
      ),
      TextButton(
        onPressed: () {
          controller.deleteProperty(property.id);
          Navigator.of(context).pop(); // Dismiss the dialog
        },
        child: const Text("Remove", style: TextStyle(color: Colors.red)),
      ),
    ],
  );
}
