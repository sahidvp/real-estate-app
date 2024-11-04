import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/views/widgets/snackbar/errorsnckbar.dart';
import 'package:real_estate/views/widgets/snackbar/successsnackbar.dart';

class EditImage extends StatefulWidget {
  const EditImage({super.key});

  @override
  State<EditImage> createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  final List<File> images = [];
  bool _isLoading = false;
  AddpropertyController ctrl = Get.find();

  _selectAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isLoading = true;
      });
      final croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        images.add(croppedFile);
        await ctrl.uploadImageToFirebase(croppedFile);
        setState(() {
          _isLoading = false;
        });
      } else {
        errorSnackBar(message: "Image not cropped");
      }
    } else {
      errorSnackBar(message: "Image not selected");
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          lockAspectRatio: false, // Allow users to change aspect ratio
        ),
      ],
    );

    if (croppedFile != null) {
      return File(croppedFile.path); // Return the cropped image file
    }
    return null; // Return null if no image is cropped
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
            "Edit photos (min 4)",
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
                for (int i = 0; i < (ctrl.imageUrls.length); i++)
                  GestureDetector(
                      onTap: () async {
                        removeImage(i);
                      },
                      child: ImageContainer(image: ctrl.imageUrls[i])),
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
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(), // Loading spinner
              ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  removeImage(int i) {
    try {
      ctrl.imageUrls.removeAt(i);
   //   _images.remove(_images[i]);
      successSnackbar("", "Image ${i + 1} removed");

      setState(() {});
    } catch (e) {
      
      errorSnackBar(
          message: "Error in removing image,try again after few seconds");
    }
  }
}

class ImageContainer extends StatelessWidget {
  final String? image;
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
                  child: Image.network(
                    image.toString(),
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
