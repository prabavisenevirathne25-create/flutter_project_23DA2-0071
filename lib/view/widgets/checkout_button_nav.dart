import 'package:flutter/material.dart';
import '/utils/app_textstyles.dart';

class CheckoutButtonNav extends StatelessWidget {
  final double totalAmount;
  final VoidCallback onPlaceOrder;

  const CheckoutButtonNav({
    super.key,
    required this.totalAmount,
    required this.onPlaceOrder,
  });
  


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPlaceOrder, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        child: Text(
          'Place Order (\Rs. ${totalAmount.toStringAsFixed(2)})',
          style: AppTextStyles.withColor(
            AppTextStyles.buttonMedium,
            Colors.white
          ),
        )
        ),
      ),
    );
  }
}
