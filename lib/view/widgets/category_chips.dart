import 'package:flutter/material.dart';
import '/utils/app_textstyles.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int selectedIndex = 0;
  final categories = ['All', 'Mens', 'Womens', 'Kids', 'Shoes', 'Bags'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(), // Smoother scrolling
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: List.generate(
          categories.length,
          (index) {
            bool isSelected = selectedIndex == index;
            
            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? primaryColor 
                      : (isDark ? Colors.grey[900] : Colors.white),
                  borderRadius: BorderRadius.circular(12), // Modern slightly rounded corners
                  border: Border.all(
                    color: isSelected 
                        ? primaryColor 
                        : (isDark ? Colors.grey[800]! : Colors.grey[200]!),
                    width: 1.5,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ] : [],
                ),
                child: Text(
                  categories[index],
                  style: AppTextStyles.withColor(
                    isSelected 
                        ? AppTextStyles.withWeight(AppTextStyles.bodySmall, FontWeight.bold)
                        : AppTextStyles.bodySmall,
                    isSelected 
                        ? Colors.white 
                        : (isDark ? Colors.grey[400]! : Colors.grey[600]!),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
