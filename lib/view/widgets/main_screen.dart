import 'package:flutter/material.dart';
import 'package:flutter_project/controllers/navigation_controller.dart';
import 'package:flutter_project/controllers/theme_controller.dart';
import 'package:flutter_project/view/widgets/account_screen.dart';
import 'package:flutter_project/view/widgets/custom_bottom_nav.dart';
import 'package:flutter_project/view/widgets/home_screen.dart';
import 'package:flutter_project/view/widgets/shopping_screen.dart';
import 'package:flutter_project/view/widgets/wishlist_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.find<NavigationController>();
    return GetBuilder<ThemeController>(
      builder: (themeController) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Obx(
            () => IndexedStack(
              key: ValueKey(navigationController.currentIndex.value),
              index: navigationController.currentIndex.value,
              children: const [
                HomeScreen(),
                ShoppingScreen(),
                WishlistScreen(),
                AccountScreen(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNav(),
      ),
    );
  }
}
