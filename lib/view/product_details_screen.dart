import 'package:flutter/material.dart';
import '/models/product.dart';
import '/utils/app_textstyles.dart';
import '/view/widgets/size_selector.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextStyles.withColor(
            AppTextStyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          ///  SHARE BUTTON
          IconButton(
            onPressed: () =>
                _shareProduct(context, product.name, product.description),
            icon: Icon(
              Icons.share,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),

      /// BODY
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ///  IMAGE (FULLY VISIBLE - FIXED)
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  color: isDark ? Colors.black : Colors.white,
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.contain, 
                  ),
                ),

                /// FAVORITE BUTTON
                Positioned(
                  right: 8,
                  top: 8,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite
                          ? Theme.of(context).primaryColor
                          : (isDark ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),

            ///  PRODUCT DETAILS
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// NAME + PRICE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.withColor(
                            AppTextStyles.h2,
                            Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color!,
                          ),
                        ),
                      ),
                      Text(
                        'Rs. ${product.price.toStringAsFixed(2)}',
                        style: AppTextStyles.withColor(
                          AppTextStyles.h2,
                          Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .color!,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  /// CATEGORY
                  Text(
                    product.Category,
                    style: AppTextStyles.withColor(
                      AppTextStyles.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),

                  SizedBox(height: screenWidth * 0.04),

                  /// SIZE TITLE
                  Text(
                    'Select Size',
                    style: AppTextStyles.withColor(
                      AppTextStyles.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),

                  SizedBox(height: screenWidth * 0.02),

                  /// SIZE SELECTOR
                  const SizeSelector(),

                  SizedBox(height: screenWidth * 0.04),

                  /// DESCRIPTION TITLE
                  Text(
                    'Description',
                    style: AppTextStyles.withColor(
                      AppTextStyles.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),

                  SizedBox(height: screenWidth * 0.02),

                  /// DESCRIPTION TEXT
                  Text(
                    product.description,
                    style: AppTextStyles.withColor(
                      AppTextStyles.bodySmall,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      /// BOTTOM BUTTONS
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [

              /// ADD TO CART
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.03,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),
                  child: Text(
                    'Add To Cart',
                    style: AppTextStyles.withColor(
                      AppTextStyles.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),

              SizedBox(width: screenWidth * 0.04),

              /// BUY NOW
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.03,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Buy Now',
                    style: AppTextStyles.withColor(
                      AppTextStyles.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///SHARE FUNCTION
  Future<void> _shareProduct(
    BuildContext context,
    String name,
    String description,
  ) async {
    final box = context.findRenderObject() as RenderBox?;
    final shareMessage = '$name\n\n$description';

    try {
      final ShareResult result = await Share.share(
        shareMessage,
        subject: name,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      if (result.status == ShareResultStatus.success) {
        debugPrint('Thank you for sharing!');
      }
    } catch (e) {
      debugPrint('Error sharing product: $e');
    }
  }
}
