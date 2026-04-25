import 'package:flutter/material.dart';
import 'package:flutter_project/utils/app_textstyles.dart';
import 'package:flutter_project/view/widgets/address_card.dart';
import 'package:flutter_project/view/widgets/checkout_button_nav.dart';
import 'package:flutter_project/view/widgets/order_confirmation_screenn.dart';
import 'package:flutter_project/view/widgets/order_summary_card.dart';
import 'package:flutter_project/view/widgets/payment_method_card.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'CheckOut',
          style: AppTextStyles.withColor(
            AppTextStyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectionTitle(context, 'Shipping Address'),
            const SizedBox(height: 16),
            const AddressCard(),
            const SizedBox(height: 16),
            _buildSelectionTitle(context, 'Payment Method'),
            const SizedBox(height: 16),
            const PaymentMethodCard(),
            const SizedBox(height: 16),
            _buildSelectionTitle(context, 'Order Summary'),
            const SizedBox(height: 16),
            const OrderSummaryCard(),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutButtonNav(
        totalAmount: 5500.00,
        onPlaceOrder: () {
          //generate a random order number
          final orderNumber =
              'ORD${DateTime.now().microsecondsSinceEpoch.toString().substring(7)}';
          Get.to(() => OrderConfirmationScreen(
            orderNumber: orderNumber,
            totalAmount: 5500.00,
          ));
        },
      ),
    );
  }

  Widget _buildSelectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextStyles.withColor(
        AppTextStyles.h3,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
    );
  }
}
