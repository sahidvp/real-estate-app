import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/widgets/snackbar/errorsnckbar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  final List<File> _images = [];
  AddpropertyController ctrl = Get.find();

  _selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = File(
          pickedFile.path); //await _cropImage(File(pickedFile.path)) as File;
      _images.add(croppedFile);
      await ctrl.uploadImageToFirebase(croppedFile);
      setState(() {});
    } else {
      Get.snackbar("Error", "Image not selected",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: AppColors.fieldcolor,
        ),
        const SizedBox(height: 15),
        Align(
          child: Text(
            "Add photos (min 4)",
            style: TextStyle(fontSize: 25, color: AppColors.primary),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 15),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // for (var image in _images)
                for (int i = 0; i < _images.length; i++)
                  GestureDetector(
                      onTap: () async {
                        removeImage(i);
                      },
                      child: ImageContainer(image: _images[i])),
                //if (_images.length < 4)
                InkWell(
                  onTap: () async {
                    await _selectAndUploadImage();
                  },
                  child: const ImageContainer(
                    icon: IconsaxPlusLinear.add,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
        const Divider(),
      ],
    );
  }

  removeImage(int i) {
    try {
      ctrl.imageUrls.removeAt(i);
      _images.remove(_images[i]);
      successSnackbar("", "Image ${i + 1} removed");
      // Get.snackbar("", "Image ${i + 1} removed",
      //     backgroundColor: Colors.transparent,
      //     snackPosition: SnackPosition.BOTTOM);
      setState(() {});
    } catch (e) {
      print(_images.length);
      errorSnackBar(
          message: "Error in removing image,try again after few seconds");
    }
  }
}

class ImageContainer extends StatelessWidget {
  final File? image;
  final IconData? icon;

  const ImageContainer({super.key, this.image, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      height: 80,
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: Colors.black, width: 1),
        color: AppColors.fieldcolor,
      ),
      child: image != null
          ? Stack(
              children: [
                Center(
                  child: Image.file(
                    image!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const Center(
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            )
          : Icon(
              icon ?? IconsaxPlusBold.folder,
              color: Colors.black,
              size: 50,
            ),
    );
  }
}
