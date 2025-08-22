import 'package:flutter/material.dart';

class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF2196F3); // Blue
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1976D2);

  // Secondary colors
  static const Color secondary = Color(0xFFFF9800); // Orange
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color secondaryDark = Color(0xFFF57C00);

  // Neutral shades
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color greyLight = Color(0xFFEEEEEE);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color greyDark = Color(0xFF616161);

  // Status colors
  static const Color success = Color(0xFF4CAF50); // Green
  static const Color error = Color(0xFFF44336);   // Red
  static const Color warning = Color(0xFFFFC107); // Amber
  static const Color info = Color(0xFF2196F3);    // Blue

  // Transparent variations
  static const Color primaryTransparent = Color.fromRGBO(0, 100, 150, 0.6);
  static const Color myColor = Color.fromARGB(255, 100, 50, 200);

  // Time Machine Font Color
  static const Color TimeMachineClr = Color(0xFF4BCFFF); // Added 4BCFFF

  // Gradient colors
  static const LinearGradient purpleToBlueGradient = LinearGradient(
    colors: [
      Color(0xBF4D2EB5), // 75% opacity
      Color(0xBF0726D5), // 75% opacity
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Example vertical gradient (top → bottom)
  static const LinearGradient purpleToBlueVertical = LinearGradient(
    colors: [
      Color(0xBF4D2EB5),
      Color(0xBF0726D5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
