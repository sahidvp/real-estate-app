import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/homepage_controller.dart';
import 'package:real_estate/utils/colors.dart';

class HomeBodyone extends StatelessWidget {
  HomeBodyone({
    super.key,
    required this.sb,
    required this.category,
  });

  final double sb;
  final List category;
  final HomeBodyController controller = Get.put(HomeBodyController());

  @override
  Widget build(BuildContext context) {
    return Container(
      //  decoration: BoxDecoration(boxShadow: [AppDecoration.boxShadow]),
      height: sb * .5,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    controller.updateSelectedIndex(index);
                  },
                  child: Container(
                    width: sb * 1.5,
                    height: sb * .5,
                    decoration: BoxDecoration(
                      color: controller.selectedIndex.value == index
                          ? AppColors
                              .primary // Change to the desired color on tap
                          : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        category[index],
                        style: controller.selectedIndex.value == index
                            ? AppTextStyles.hompagebodyText2
                            : AppTextStyles.hompagebodyText,
                      ),
                    ),
                  ),
                ),
              );
            });
          }),
    );
  }
}
