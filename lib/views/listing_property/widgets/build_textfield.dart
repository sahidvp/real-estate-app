import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

TextFormField buildTextfield(
    AddpropertyController propertyCntr,
    TextEditingController textcontroller,
    bool keybordnum,
    int index,
    String texthint) {
  return TextFormField(
    maxLines: textcontroller == propertyCntr.description ? 6 : null,
    maxLength: keybordnum == false ? 10 * index : null,
    keyboardType:
        keybordnum == true ? TextInputType.number : TextInputType.name,
    controller: textcontroller,
    decoration: InputDecoration(
        //prefixIcon: textcontroller == propertyCntr.price ? Icon(IconsaxPlusBold.amou) : null,
        hintText: texthint,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
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
