import 'package:flutter/material.dart';
import '/features/Edit_profile/profile_form.dart';
import '/features/Edit_profile/profile_image.dart';
import '/utils/app_textstyles.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Edit Profile',
          style: AppTextStyles.withColor(
            AppTextStyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24), 
            ProfileImage(),
            SizedBox(height: 32), 
            ProfileForm(),
          ],
        ),
      ),
    );
  }
}
