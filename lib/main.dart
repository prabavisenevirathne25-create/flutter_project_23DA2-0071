import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/auth_controller.dart';
import 'package:flutter_project/controllers/navigation_controller.dart';
import '../view/first_screen.dart';
import 'package:flutter_project/utils/app_themestyles.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter_project/controllers/theme_controller.dart';

void main() async {
  await GetStorage.init();
  Get.put(ThemeController());
  Get.put(AuthController());
  Get.put(NavigationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Store',
      theme: AppThemes.light,
      themeMode: themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      defaultTransition: Transition.fade,
      home: FirstScreen(),
    );
  }
}
