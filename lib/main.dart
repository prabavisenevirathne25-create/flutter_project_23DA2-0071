import 'package:flutter/material.dart';
import 'controllers/auth_controller.dart';
import 'controllers/navigation_controller.dart';
import 'view/first_screen.dart';
import 'utils/app_themestyles.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'controllers/theme_controller.dart';


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
