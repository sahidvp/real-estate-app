import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/controller/firbase/firebase_constant.dart';

import 'package:real_estate/views/splashscreen.dart';
import 'package:real_estate/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseintialisation;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Real estate",
      theme: Apptheme().myTheme,
      home:  SplashScreen()
    );
  }
}
