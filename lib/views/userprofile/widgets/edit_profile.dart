import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';

void showEditOptions(BuildContext context, AuthController cntrl) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15.0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a photo'),
              onTap: () {
                cntrl.takePictureAndUpload();
                Get.back();
                // Handle taking a photo
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from gallery'),
              onTap: () async {
                cntrl.selectAndUploadImage();
                Get.back();

                // Handle choosing from gallery
              },
            ),
          ],
        ),
      );
    },
  );
}
