import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';
import 'package:real_estate/model/onbordingpage/images.dart';
import 'package:real_estate/model/onbordingpage/pageview.dart';
import 'package:real_estate/model/onbordingpage/text.dart';
import 'package:real_estate/views/Loginpage/loginscreen.dart';
import 'package:real_estate/views/bottom_navbar/bottom_nav.dart';

class OnboardingScreen extends GetView {
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {

            if (snapshot.hasData) {

              return BottomNavbar();
              
            } else {
              return Scaffold(
                body: PageView.builder(
                  controller: _pageController,
                  itemCount: 3, // Assuming you have 3 onboarding pages
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return OnboardingPage(
                          showBackButton: false,
                          pageController: _pageController,
                          imagePath: Onbordingimg().onbordingimages[index],
                          textSpans: Onbordingtext().onbordingpageoneText,
                          buttontext: "Next",
                          onNext: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        );
                      case 1:
                        return OnboardingPage(
                          showBackButton: true,
                          pageController: _pageController,
                          imagePath: Onbordingimg().onbordingimages[index],
                          textSpans: Onbordingtext().onbordingpagetwoText,
                          buttontext: "Next",
                          onNext: () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        );
                      case 2:
                        return OnboardingPage(
                          showBackButton: true,
                          pageController: _pageController,
                          imagePath: Onbordingimg().onbordingimages[index],
                          textSpans: Onbordingtext().onbordingpagethreeText,
                          buttontext: "Get Started",
                          onNext: () {
                            Future.delayed(const Duration(milliseconds: 300),
                                () {
                              Get.to(() => const Loginscreen());
                            });
                          },
                        );
                      default:
                        throw Exception("Invalid index $index");
                    }
                  },
                ),
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
