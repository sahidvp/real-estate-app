// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:real_estate/controller/firbase/firebase_constant.dart';
// import 'package:real_estate/controller/logincontroller.dart';
// import 'package:real_estate/views/widgets/logoutdialouge.dart';

// class BottomNavbar extends StatelessWidget {
//   const BottomNavbar({super.key});

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: ()  {
//                 showConfirmationDialog(context);

//               },
//             child: Text(auth.currentUser!.displayName.toString())),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/bottomnavcontroller.dart';
import 'package:real_estate/utils/colors.dart';
import 'package:real_estate/utils/icons.dart';

import 'package:real_estate/views/Homepage/homescreen.dart';
import 'package:real_estate/views/chatscreen/chatscreen.dart';
import 'package:real_estate/views/listingpropert/addpropertyscreen.dart';
import 'package:real_estate/views/userprofile/userprofilescreen.dart';
import 'package:real_estate/views/widgets/logoutdialouge.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({super.key});
  

  final BottomNavController bottomNavController =
      Get.put(BottomNavController());

  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatScreen(),
    const AddPropertyscreen(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       // title: const Text('Bottom Navigation Bar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              showConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Obx(() => _pages[bottomNavController.selectedIndex.value]),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        backgroundColor: Colors.white,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Iconsdata.homepage),
                label: '--',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsdata.chatpage),
                label: '--',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsdata.addpropertypage),
                label: '--',
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsdata.user),
                label: '--',
              ),
            ],
            currentIndex: bottomNavController.selectedIndex.value,
            selectedItemColor: AppColors.primary,
            unselectedItemColor:AppColors.unselectitem ,
            onTap: (index) => bottomNavController.changeIndex(index),
          )),
    );
  }
}
