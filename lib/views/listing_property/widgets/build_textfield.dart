import 'package:flutter/material.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

TextFormField buildTextfield(AddpropertyController propertyCntr,
    TextEditingController builtupArea, bool keybordnum, int index) {
  return TextFormField(
    maxLength: keybordnum == false ? 10 * index : null,
    keyboardType:
        keybordnum == true ? TextInputType.number : TextInputType.name,
    controller: builtupArea,
    decoration: InputDecoration(
        fillColor: AppColors.fieldcolor,
        // Background color
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: AppColors.primary, // Color when the field is focused
            width: 2.0,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withAlpha(150)),
            borderRadius: BorderRadius.circular(15))),
  );
}
