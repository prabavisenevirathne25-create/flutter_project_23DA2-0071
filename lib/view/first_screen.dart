import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/view/widgets/main_screen.dart';
import 'package:flutter_project/view/widgets/onboarding_screen.dart';
import 'package:flutter_project/view/widgets/sign_screen.dart';
import '../controllers/auth_controller.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  final AuthController authController = Get.find<AuthController>();

  late AnimationController _controller;
  late Animation<double> scaleAnim;
  late Animation<double> fadeAnim;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    scaleAnim = Tween(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    fadeAnim = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    /// Navigation
    Timer(const Duration(seconds: 3), () {
      if (authController.isFirstTime) {
        Get.off(() => const OnboardingScreen());
      } else if (authController.isLoggedIn) {
        Get.off(() => const MainScreen());
      } else {
        Get.off(() => SignInScreen());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Scaffold(
      body: Stack(
        children: [
          ///  Gradient Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primary,
                  primary.withAlpha(220),
                  Colors.black,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          ///  Floating circles (modern effect)
          Positioned(
            top: -50,
            left: -30,
            child: _circle(primary.withAlpha(80), 200),
          ),
          Positioned(
            bottom: -60,
            right: -40,
            child: _circle(primary.withAlpha(60), 250),
          ),

          ///  Center Glass Card
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: fadeAnim.value,
                  child: Transform.scale(
                    scale: scaleAnim.value,
                    child: child,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withAlpha(60)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// ICON
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        size: 40,
                        color: primary,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// TITLE
                    const Text(
                      "TRENDY HUB",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// SUBTITLE
                    Text(
                      "Your Fashion Destination",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withAlpha(200),
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Bottom Tagline
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: FadeTransition(
              opacity: fadeAnim,
              child: Text(
                "Discover Trends. Elevate Style. Shop Smart.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withAlpha(180),
                  fontSize: 13,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///  Circle widget
  Widget _circle(Color color, double size) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}