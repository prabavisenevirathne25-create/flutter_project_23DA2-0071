import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/utils/app_textstyles.dart';


class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        children: [
          _buildSummaryRow(context, 'Subtotal', '\Rs.5000.00'),
          const SizedBox(height: 8),
          _buildSummaryRow(context, 'Shipping', '\Rs.500.00'),
          const SizedBox(height: 8),
          _buildSummaryRow(context, 'Tax', '\Rs.0'),
          const Padding(padding: EdgeInsets.symmetric(vertical: 12),
          child: Divider(),
          ),
          _buildSummaryRow(context, 'Total', '\Rs.5500.00', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String label,
    String value, {
    bool isTotal = false,
  }) {
    final textStyle = isTotal ? AppTextStyles.h3 : AppTextStyles.bodyLarge;
    final color = isTotal
        ? Theme.of(context).primaryColor
        : Theme.of(context).textTheme.bodyLarge!.color!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppTextStyles.withColor(textStyle, color)),
        Text(value, style: AppTextStyles.withColor(textStyle, color)),
      ],
    );
  }
}
