// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate/controller/bottomnavcontroller.dart';
// import 'package:real_estate/utils/colors.dart';
// import 'package:real_estate/utils/icons.dart';

// import 'package:real_estate/views/Homepage/homescreen.dart';
// import 'package:real_estate/views/chatscreen/chatscreen.dart';
// import 'package:real_estate/views/listingpropert/addpropertyscreen.dart';
// import 'package:real_estate/views/userprofile/userprofilescreen.dart';
// import 'package:real_estate/views/widgets/logoutdialouge.dart';

// class BottomNavbar extends StatelessWidget {
//   BottomNavbar({super.key});

//   final BottomNavController bottomNavController =
//       Get.put(BottomNavController());

//   final List<Widget> _pages = [
//     const HomeScreen(),
//     const ChatScreen(),
//     const AddPropertyscreen(),
//     const UserProfile(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         // backgroundColor: Colors.amber,
//         // title: const Text('Bottom Navigation Bar'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               showConfirmationDialog(context);
//             },
//           ),
//         ],
//       ),
//       body: Obx(() => _pages[bottomNavController.selectedIndex.value]),
//       bottomNavigationBar: Obx(() => Container(
//             decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(15)),
//             child: BottomNavigationBar(
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               items: <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                   icon: Icon(Iconsdata.homepage),
//                   label: '--',
//                   activeIcon: navbarIcon(Iconsdata.homepageactive),
//                 ),
//                 BottomNavigationBarItem(
//                     icon: Icon(Iconsdata.chatpage),
//                     label: '--',
//                     activeIcon: navbarIcon(Iconsdata.homepageactive)),
//                 BottomNavigationBarItem(
//                     icon: Icon(Iconsdata.addpropertypage),
//                     label: '--',
//                     activeIcon: navbarIcon(Iconsdata.addpropertypageactive)),
//                 BottomNavigationBarItem(
//                     icon: Icon(Iconsdata.user),
//                     label: '--',
//                     activeIcon: navbarIcon(Iconsdata.useractive)),
//               ],
//               currentIndex: bottomNavController.selectedIndex.value,
//               selectedItemColor: AppColors.primary,
//               unselectedItemColor: AppColors.unselectitem,
//               onTap: (index) => bottomNavController.changeIndex(index),
//             ),
//           )),
//     );
//   }

//   Column navbarIcon(IconData icon) {
//     return Column(
//       children: [
//         Icon(icon, color: AppColors.primary),
//         const SizedBox(
//           height: 3,
//         ),
//         Container(
//           height: 5,
//           width: 5,
//           decoration:
//               const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/bottomnav_controller.dart';
import 'package:real_estate/controller/logincontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/icons.dart';
import 'package:real_estate/views/home_page/home_page.dart';
import 'package:real_estate/views/chat_screen/chat_screen.dart';
import 'package:real_estate/views/listing_property/addproperty_screen.dart';
import 'package:real_estate/views/select_category/select_category.dart';
import 'package:real_estate/views/userprofile/userprofile_screen.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});
  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  final AuthController cntrl = Get.put(AuthController());

  // Call the getUserData method here

  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatScreen(),
    const SelectCategory(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    cntrl.getUserData();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.logout,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         showConfirmationDialog(context);
      //       },
      //     ),
      //   ],
      // ),
      body: Obx(() => _pages[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Iconsdata.homepage,
                color: Colors.black87,
              ),
              label: '--',
              activeIcon: navbarIcon(Iconsdata.homepageactive),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsdata.chatpage, color: Colors.black87),
              label: '--',
              activeIcon: navbarIcon(Iconsdata.chatpageactive),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsdata.addpropertypage, color: Colors.black87),
              label: '--',
              activeIcon: navbarIcon(Iconsdata.addpropertypageactive),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsdata.user, color: Colors.black87),
              label: '--',
              activeIcon: navbarIcon(Iconsdata.useractive),
            ),
          ],
          currentIndex: bottomNavController.selectedIndex.value,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.unselectitem,
          onTap: (index) => bottomNavController.changeIndex(index),
        ),
      ),
    );
  }

  Column navbarIcon(IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(
          height: 3,
        ),
        Container(
          height: 5,
          width: 5,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        )
      ],
    );
  }
}
