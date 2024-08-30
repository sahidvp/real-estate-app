import 'package:flutter/material.dart';
import 'package:real_estate/controller/addproperty_controller.dart';
import 'package:real_estate/utils/colors.dart';

class SubmitButtontwo extends StatelessWidget {
  const SubmitButtontwo({
    super.key,
    required this.controller,
    required this.buttonname,
    required this.onPressed,
  });

  final  AddpropertyController controller;
  final String buttonname;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final buttonwidth = screenWidth * 0.6;
    final buttonheight = screenHeight * 0.07;

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: buttonheight,
        width: buttonwidth,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              backgroundColor: AppColors.primary),
          child: Text(
            buttonname,
            style: AppTextStyles.headline6,
          ),
        ),
      ),
    );
  }
}
