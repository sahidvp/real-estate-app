import 'package:flutter/material.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/imagespath.dart';
import 'package:real_estate/views/onbordingpages/widgets/buttons.dart';
import 'package:real_estate/commonwidgdets/richtext.dart';

class OnboardingPage extends StatelessWidget {
  final PageController pageController;
  final String imagePath;
  final List<TextSpan> textSpans;
  final VoidCallback onNext;
  final String buttontext;
  final bool showBackButton; // New parameter to control back button visibility

  const OnboardingPage({
    Key? key,
    required this.pageController,
    required this.imagePath,
    required this.textSpans,
    required this.onNext,
    required this.buttontext,
    required this.showBackButton, // Add this to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(Imagepath
                      .homelogo), // Replace with actual image path or widget
                  const SkipButton(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RichTexts(textspans: textSpans),
            const SizedBox(height: 20),
            Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 35,
                  left: 55,
                  child: Row(
                    children: [
                      if (showBackButton)
                        IconButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: Color.fromARGB(255, 82, 70, 70),
                          ),
                        )
                      else
                        const SizedBox(
                          width: 48,
                        ),
                      SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: onNext,
                          child: Text(
                            buttontext,
                            style: AppTextStyles.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
