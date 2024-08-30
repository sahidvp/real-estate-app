import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/views/onbordingpages/onboardingscreen.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    Future.delayed(const Duration(seconds: 3), () async {
      Get.off(() => OnboardingScreen());
      await authController.getUserData();
    });
    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  AppColors.textPrimary
                      .withOpacity(0.5), // Apply desired opacity here
                  AppColors.textPrimary.withOpacity(0.5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            blendMode: BlendMode
                .srcATop, // Ensure the blend mode applies the shader on top
            child: SizedBox(
              width: double.infinity,
              height: double
                  .infinity, // Ensure the ShaderMask covers the entire screen
              child: Image.asset(
                Imagepath.splashimg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                Imagepath.homelogo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
