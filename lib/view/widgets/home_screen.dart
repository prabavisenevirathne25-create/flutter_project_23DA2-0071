import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/controllers/theme_controller.dart';
import '/view/all_products_screen.dart';
import '/view/cart_screen.dart';
import '/view/widgets/category_chips.dart';
import '/view/widgets/custom_search_bar.dart';
import '/view/widgets/product_grid.dart';
import '/view/widgets/sale_banner.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //header section
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, User!",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        "Welcome to our store",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  //notification icon
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  //cart button
                  IconButton(
                    onPressed: () => Get.to(() => const CartScreen()),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //search bar
            const CustomSearchBar(),

            //category chips
            const CategoryChips(),

            //sale banner
            const SaleBanner(),

            //popular product
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            //product grid
            const Expanded (child: ProductGrid()),
          ],
        ),
      ),
    );
  }
}
