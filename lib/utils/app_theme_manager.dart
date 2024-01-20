import 'package:flutter/material.dart';

class AppThemeManager {
  // Gradients
  static const Color backgroundGradientStart = Color(0xFF4943FF);
  static const Color backgroundGradientMiddle = Color(0xFF9430DD);
  static const Color backgroundGradientEnd = Color(0xFF9D00FF);

  static const Color lightCardGradientStart = Color(0xFFFBFFFF);
  static const Color lightCardGradientEnd = Color(0xFFD7D7D7);
  static const Color darkCardGradientStart = Color(0xFF202020);
  static const Color darkCardGradientEnd = Color(0xFF040000);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFFE2E2E2),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
    )
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: const Color(0xFFE2E2E2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
      )
  );
}