import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  //headings
  static TextStyle get h1 => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle get h2 => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  static TextStyle get h3 =>
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600);

  //body

  static TextStyle get bodyLarge =>
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle get bodyMedium => GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.2,
  );
  static TextStyle get bodySmall =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400);

  //button text
  static TextStyle get buttonLarge => GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static TextStyle get buttonMedium =>
      GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600);
  static TextStyle get buttonSmall => GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  //label text
  static TextStyle get labelMedium =>
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
  //helper functions for color variation
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  //
  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}
