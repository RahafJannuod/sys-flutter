import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors - Deep red CTA system
  static const Color primary = Color(0xFFC72B2B); // Deep red for CTAs (#C72B2B)
  static const Color primaryLight = Color(0xFFE53935); // Lighter red for hover states
  static const Color primaryDark = Color(0xFFA52A2A); // Darker red for pressed states

  // Secondary Colors - Keep some warmth
  static const Color secondary = Color(0xFFFF7043); // Orange-red for secondary actions
  static const Color secondaryLight = Color(0xFFFF8A65);
  static const Color secondaryDark = Color(0xFFE64A19);

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFE53935); // Same as primary for consistency
  static const Color info = Color(0xFF2196F3);

  // Neutral Colors - Clean grays
  static const Color neutral50 = Color(0xFFFAFAFA); // Very light gray
  static const Color neutral100 = Color(0xFFF5F5F5); // Light background
  static const Color neutral200 = Color(0xFFEEEEEE); // Card borders
  static const Color neutral300 = Color(0xFFE0E0E0); // Subtle borders
  static const Color neutral400 = Color(0xFFBDBDBD); // Inactive elements
  static const Color neutral500 = Color(0xFF9E9E9E); // Placeholders
  static const Color neutral600 = Color(0xFF757575); // Secondary text
  static const Color neutral700 = Color(0xFF616161); // Body text
  static const Color neutral800 = Color(0xFF424242); // Headings
  static const Color neutral900 = Color(0xFF212121); // Primary text

  // Background Colors - White and light gray dominant
  static const Color backgroundLight = Colors.white; // Pure white primary background
  static const Color backgroundSecondary = neutral50; // Very light gray for sections
  static const Color backgroundDark = neutral900;
  static const Color surfaceLight = Colors.white; // Card backgrounds
  static const Color surfaceElevated = neutral50; // Elevated surfaces
  static const Color surfaceDark = neutral800;

  // Text Colors - Dark gray/black for readability
  static const Color textPrimary = neutral900; // Primary text - black
  static const Color textSecondary = neutral600; // Secondary text - medium gray
  static const Color textTertiary = neutral500; // Tertiary text - light gray
  static const Color textDisabled = neutral400;
  static const Color textOnPrimary = Colors.white; // White text on red
  static const Color textOnSecondary = Colors.white;
  static const Color textPrice = primary; // Red text for prices

  // Border Colors
  static const Color borderLight = neutral200; // Subtle borders
  static const Color borderMedium = neutral300; // Card borders
  static const Color borderDark = neutral600;

  // Category Colors (for product categories) - Softer, more cohesive with red theme
  static const Map<String, Color> categoryColors = {
    'used_items': Color(0xFF9C27B0), // Purple
    'homemade_pantry': Color(0xFFFF7043), // Orange-red
    'handmade_crafts': Color(0xFFE91E63), // Pink-red
    'free_products': Color(0xFF4CAF50), // Green
    'delivery_services': Color(0xFF2196F3), // Blue
  };

  // Filter Button Colors - Pill-shaped filter styling
  static const Color filterButtonBackground = neutral100; // Light gray background
  static const Color filterButtonText = neutral700; // Dark gray text
  static const Color filterButtonActive = primary; // Red when active
  static const Color filterButtonActiveText = Colors.white;

  // Product Card Colors
  static const Color cardBackground = Colors.white;
  static const Color cardShadow = Color(0x0F000000); // Very subtle shadow
  static const Color cardBorder = neutral200;

  // Bottom Navigation Colors
  static const Color navigationBackground = Colors.white;
  static const Color navigationSelected = primary; // Red for selected items
  static const Color navigationUnselected = neutral500;
  static const Color navigationAddButton = primary; // Red circular "Add Product" button

  // Search Bar Colors
  static const Color searchBarBackground = Colors.white;
  static const Color searchBarBorder = neutral300;
  static const Color searchBarText = neutral900;
  static const Color searchBarHint = neutral500; // Subtle gray for placeholder
  static const Color searchBarIcon = neutral600; // Gray for magnifying glass

  // Navigation Bar Colors
  static const Color navBarBackground = Colors.white;
  static const Color navBarText = neutral900;
  static const Color navBarIcon = neutral700;
  static const Color notificationDot = primary; // Red notification dots
  static const Color orangeButton = Color(0xFFFF7043); // Circular orange button

  // Dropdown Colors
  static const Color dropdownBackground = Colors.white;
  static const Color dropdownBorder = neutral300;
  static const Color dropdownText = neutral700;
  static const Color dropdownIcon = neutral500; // Down arrow icons

  // Button Colors
  static const Color clearFiltersText = neutral600; // Gray text for clear filters
  static const Color applyFiltersBackground = primary; // Deep red background
}