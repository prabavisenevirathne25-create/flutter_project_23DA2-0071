import 'package:flutter/material.dart';
import '/controllers/theme_controller.dart';
import '/utils/app_textstyles.dart';
import 'package:get/get.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Settings',
          style: AppTextStyles.withColor(
            AppTextStyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelection(context, 'Appearance', [
              _buildThemeToggle(),
            ]),
            _buildSelection(context, 'Notifications', [
              _buildSwitchTile(
                'Push Notifications',
                'Receive Push notifications about orders and promotions',
                true,
              ),
              _buildSwitchTile(
                'Email Notifications',
                'Receive email updates about your orders',
                false,
              ),
            ]),
            _buildSelection(context, 'Privacy', [
              _buildNavigationTile(
                'Privacy Policy',
                'View our privacy policy',
                Icons.privacy_tip_outlined,
              ),
            ]),
            _buildSelection(context, 'Terms', [
              _buildNavigationTile(
                'Terms of Service',
                'Read our terms of service',
                Icons.description_outlined,
              ),
            ]),
            _buildSelection(context, 'About', [
              _buildNavigationTile(
                'App Version',
                '1.0.0',
                Icons.info_outline,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSelection(BuildContext context, String title, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          child: Text(
            title,
            style: AppTextStyles.withColor(
              AppTextStyles.h3,
              isDark ? Colors.grey[400]! : Colors.grey[600]!,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildThemeToggle() {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        final isDark = controller.isDarkMode;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey[900] : Colors.white,
            borderRadius: BorderRadius.circular(12),
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
          child: ListTile(
            leading: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: Get.theme.primaryColor,
            ),
            title: Text(
              'Dark Mode',
              style: AppTextStyles.withColor(
                AppTextStyles.bodyMedium,
                Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            trailing: Switch.adaptive(
              value: isDark,
              onChanged: (value) => controller.toggleTheme(),
              activeThumbColor: Get.theme.primaryColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value) {
    final isDark = Get.isDarkMode;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
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
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.withColor(
            AppTextStyles.bodyMedium,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.withColor(
            AppTextStyles.bodySmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Switch.adaptive(
          value: value,
          onChanged: (v) {},
          activeThumbColor: Get.theme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildNavigationTile(String title, String subtitle, IconData icon) {
    final isDark = Get.isDarkMode;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(12),
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
      child: ListTile(
        leading: Icon(
          icon,
          color: Get.theme.primaryColor,
        ),
        title: Text(
          title,
          style: AppTextStyles.withColor(
            AppTextStyles.bodyMedium,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.withColor(
            AppTextStyles.bodySmall,
            isDark ? Colors.grey[400]! : Colors.grey[600]!,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: isDark ? Colors.grey[400]! : Colors.grey[600]!,
        ),
        onTap: () {},
      ),
    );
  }
}
