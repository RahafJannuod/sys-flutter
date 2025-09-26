import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  // Font Families - Clean, modern sans-serif fonts
  static const String? arabicFont = null; // System Arabic font
  static const String englishFont = 'Roboto'; // Clean, readable sans-serif

  // Base font sizes (following Material Design type scale)
  static const double displayLarge = 57.0;
  static const double displayMedium = 45.0;
  static const double displaySmall = 36.0;
  static const double headlineLarge = 32.0;
  static const double headlineMedium = 28.0;
  static const double headlineSmall = 24.0;
  static const double titleLarge = 22.0;
  static const double titleMedium = 16.0;
  static const double titleSmall = 14.0;
  static const double bodyLarge = 16.0;
  static const double bodyMedium = 14.0;
  static const double bodySmall = 12.0;
  static const double labelLarge = 14.0;
  static const double labelMedium = 12.0;
  static const double labelSmall = 11.0;

  // Arabic Text Styles
  static const TextStyle arabicDisplayLarge = TextStyle(
    fontFamily: arabicFont,
    fontSize: displayLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle arabicHeadlineLarge = TextStyle(
    fontFamily: arabicFont,
    fontSize: headlineLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle arabicTitleLarge = TextStyle(
    fontFamily: arabicFont,
    fontSize: titleLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.27,
  );

  static const TextStyle arabicBodyLarge = TextStyle(
    fontFamily: arabicFont,
    fontSize: bodyLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle arabicBodyMedium = TextStyle(
    fontFamily: arabicFont,
    fontSize: bodyMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  // English Text Styles
  static const TextStyle englishDisplayLarge = TextStyle(
    fontFamily: englishFont,
    fontSize: displayLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle englishHeadlineLarge = TextStyle(
    fontFamily: englishFont,
    fontSize: headlineLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.25,
  );

  static const TextStyle englishTitleLarge = TextStyle(
    fontFamily: englishFont,
    fontSize: titleLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    height: 1.27,
  );

  static const TextStyle englishBodyLarge = TextStyle(
    fontFamily: englishFont,
    fontSize: bodyLarge,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle englishBodyMedium = TextStyle(
    fontFamily: englishFont,
    fontSize: bodyMedium,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle englishTitleMedium = TextStyle(
    fontFamily: englishFont,
    fontSize: titleMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
    height: 1.5,
  );

  // Button Text Styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: labelLarge,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    height: 1.14,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: labelMedium,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.25,
    height: 1.33,
  );

  // Caption and Label Styles
  static const TextStyle caption = TextStyle(
    fontSize: bodySmall,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  static const TextStyle overline = TextStyle(
    fontSize: labelSmall,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
    height: 1.45,
  );

  // Method to get appropriate text style based on locale
  static TextStyle getLocalizedStyle(TextStyle baseStyle, Locale locale) {
    if (locale.languageCode == 'ar') {
      return baseStyle.copyWith(fontFamily: arabicFont);
    }
    return baseStyle.copyWith(fontFamily: englishFont);
  }

  // Method to create bold variant
  static TextStyle bold(TextStyle baseStyle) {
    return baseStyle.copyWith(fontWeight: FontWeight.w700);
  }

  // Method to create medium weight variant
  static TextStyle medium(TextStyle baseStyle) {
    return baseStyle.copyWith(fontWeight: FontWeight.w500);
  }

  // CUI Design Specific Styles
  // Section Titles - Large, bold font for "Newest Products," "Explore"
  static const TextStyle sectionTitle = TextStyle(
    fontFamily: englishFont,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
    height: 1.2,
  );

  // Product Name - Standard size, bold for product names
  static const TextStyle productName = TextStyle(
    fontFamily: englishFont,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
    height: 1.3,
  );

  // Product Price - Bold red text for pricing
  static const TextStyle productPrice = TextStyle(
    fontFamily: englishFont,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    height: 1.3,
  );

  // Location Text - Smaller, lighter font for location details
  static const TextStyle locationText = TextStyle(
    fontFamily: englishFont,
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Filter Button Text - Medium weight for filter buttons
  static const TextStyle filterButton = TextStyle(
    fontFamily: englishFont,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
    height: 1.2,
  );

  // Navigation Text - Small text for bottom navigation
  static const TextStyle navigationLabel = TextStyle(
    fontFamily: englishFont,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
    height: 1.45,
  );

  // Search Placeholder - Medium weight for search hints
  static const TextStyle searchHint = TextStyle(
    fontFamily: englishFont,
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  // App Logo Text - Bold for SYS Souq branding
  static const TextStyle logoText = TextStyle(
    fontFamily: englishFont,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.15,
    height: 1.2,
  );
}