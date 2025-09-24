import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF2E7D6A);
  static const Color primaryLight = Color(0xFF5AAD97);
  static const Color primaryDark = Color(0xFF1B4D42);

  // Secondary Colors
  static const Color secondary = Color(0xFFE67E22);
  static const Color secondaryLight = Color(0xFFF39C12);
  static const Color secondaryDark = Color(0xFFD35400);

  // Semantic Colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // Neutral Colors
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF212121);

  // Cultural Colors (warm tones for Middle Eastern aesthetic)
  static const Color culturalWarm = Color(0xFFD4A574);
  static const Color culturalEarth = Color(0xFF8B7355);
  static const Color culturalGold = Color(0xFFDAA520);

  // Background Colors
  static const Color backgroundLight = neutral50;
  static const Color backgroundDark = neutral900;
  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = neutral800;

  // Text Colors
  static const Color textPrimary = neutral900;
  static const Color textSecondary = neutral700;
  static const Color textDisabled = neutral500;
  static const Color textOnPrimary = Colors.white;
  static const Color textOnSecondary = Colors.white;

  // Border Colors
  static const Color borderLight = neutral300;
  static const Color borderDark = neutral600;

  // Category Colors (for product categories)
  static const Map<String, Color> categoryColors = {
    'used_items': Color(0xFF8E44AD),
    'homemade_pantry': Color(0xFFE67E22),
    'handmade_crafts': Color(0xFFE91E63),
    'free_products': Color(0xFF27AE60),
    'delivery_services': Color(0xFF3498DB),
  };
}