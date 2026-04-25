import 'package:flutter/material.dart';

class AppThemes {
  static final light = ThemeData(
    primaryColor: const Color(0xFF7500cc),
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
        ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7500cc),
      primary: const Color(0xFF5700cc),
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    cardColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xFF5700cc),
      unselectedItemColor: Colors.grey,

    ),

  );

  //dark theme
  static final dark = ThemeData(
    primaryColor: const Color(0xFF7500cc),
    scaffoldBackgroundColor: const Color(0xFF121212),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
        ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7500cc),
      primary: const Color(0xFF5700cc),
      brightness: Brightness.dark,
      surface: const Color(0xFF121212),
    ),
    cardColor: const Color(0xFF1E1E1E),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
      selectedItemColor: Color(0xFF5700cc),
      unselectedItemColor: Colors.grey,

    ),

  );

}
