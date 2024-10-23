// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/addproperty_controller.dart';
// import 'package:real_estate/controller/homepage_controller.dart';
// import 'package:real_estate/utils/colors.dart';

// class HomeBodyone extends StatelessWidget {
//   HomeBodyone({
//     super.key,
//     required this.sb,
//     required this.category,
//   });

//   final double sb;
//   final List category;

//   final AddpropertyController controller = Get.put(AddpropertyController());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //  decoration: BoxDecoration(boxShadow: [AppDecoration.boxShadow]),
//       height: sb * .5,
//       width: double.infinity,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: category.length,
//           itemBuilder: (context, index) {
//             return Obx(() {
//               bool isSelected = controller.filterIndex.value == index;
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: GestureDetector(
//                   onTap: () {
//                     updateSelectedIndex(index);
//                   },
//                   child: Container(
//                     width: sb * 1.5,
//                     height: sb * .5,
//                     decoration: BoxDecoration(
//                       color: isSelected
//                           ? AppColors
//                               .primary // Change to the desired color on tap
//                           : Colors.grey[300],
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: Center(
//                       child: Text(
//                         category[index],
//                         style: isSelected
//                             ? AppTextStyles.hompagebodyText2
//                             : AppTextStyles.hompagebodyText,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             });
//           }),
//     );
//   }

//   void updateSelectedIndex(int index) {
//     if (index == controller.filterIndex.value) {
//       controller.filterIndex.value = index - 10;
//       return;
//     }
//     controller.filterIndex.value = index;
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/colors.dart';

class HomeBodyone extends StatelessWidget {
  final double sb;
  final List<String> category;
  final RxInt selectedIndex;
  final Function(int) onSelected;

  HomeBodyone({
    super.key,
    required this.sb,
    required this.category,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sb * .5,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return Obx(() {
            bool isSelected = selectedIndex.value == index;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  onSelected(index); // Use the passed function to update index
                },
                child: Container(
                  width: sb * 1.5,
                  height: sb * .5,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary // Selected color
                        : Colors.grey[300], // Unselected color
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: Text(
                      category[index],
                      style: isSelected
                          ? AppTextStyles.hompagebodyText2 // Selected style
                          : AppTextStyles.hompagebodyText, // Unselected style
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
