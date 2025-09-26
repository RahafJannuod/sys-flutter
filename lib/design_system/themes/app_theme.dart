import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../typography/app_typography.dart';
import '../spacing/app_spacing.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => _buildTheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.backgroundLight,
        surface: AppColors.surfaceLight,
        error: AppColors.error,
      );

  static ThemeData get darkTheme => _buildTheme(
        brightness: Brightness.dark,
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        background: AppColors.backgroundDark,
        surface: AppColors.surfaceDark,
        error: AppColors.error,
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color primary,
    required Color secondary,
    required Color background,
    required Color surface,
    required Color error,
  }) {
    final bool isDark = brightness == Brightness.dark;

    final ColorScheme colorScheme = ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: AppColors.textOnPrimary,
      secondary: secondary,
      onSecondary: AppColors.textOnSecondary,
      error: error,
      onError: Colors.white,
      surface: surface,
      onSurface: isDark ? AppColors.neutral100 : AppColors.textPrimary,
    );

    return ThemeData(
      colorScheme: colorScheme,
      brightness: brightness,
      fontFamily: AppTypography.englishFont,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundLight,
        foregroundColor: AppColors.textPrimary,
        elevation: 0, // Clean flat design
        centerTitle: false,
        titleTextStyle: AppTypography.logoText.copyWith(
          color: AppColors.textPrimary,
        ),
        iconTheme: IconThemeData(
          color: AppColors.textPrimary,
        ),
      ),

      // Card Theme - Clean white cards with subtle shadows
      cardTheme: CardThemeData(
        elevation: 2, // Subtle shadow
        margin: const EdgeInsets.all(AppSpacing.s),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM), // Rounded corners
          side: const BorderSide(
            color: AppColors.cardBorder,
            width: 0.5,
          ),
        ),
        color: AppColors.cardBackground,
        shadowColor: AppColors.cardShadow,
      ),

      // Elevated Button Theme - Red CTA buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary, // Red background
          foregroundColor: AppColors.textOnPrimary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          minimumSize: const Size(double.infinity, AppSpacing.minTouchTarget),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusS), // Less rounded for CUI
          ),
          textStyle: AppTypography.buttonLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Outlined Button Theme - Filter button style
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.filterButtonText,
          backgroundColor: AppColors.filterButtonBackground, // Light gray background
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.s,
          ),
          minimumSize: const Size(0, 36), // Pill-shaped height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18), // Pill-shaped
          ),
          side: const BorderSide(color: AppColors.borderLight),
          textStyle: AppTypography.filterButton,
        ),
      ),

      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.l,
            vertical: AppSpacing.s,
          ),
          textStyle: AppTypography.buttonMedium,
        ),
      ),

      // Input Decoration Theme - Search bar styling
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.searchBarBackground, // Light gray background
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.m,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: const BorderSide(
            color: AppColors.searchBarBorder,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: const BorderSide(
            color: AppColors.searchBarBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: AppTypography.searchHint.copyWith(
          color: AppColors.textSecondary,
        ),
        hintStyle: AppTypography.searchHint.copyWith(
          color: AppColors.searchBarHint,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? AppColors.neutral700 : AppColors.neutral200,
        selectedColor: AppColors.primary.withValues(alpha: 0.1),
        labelStyle: AppTypography.englishBodyMedium,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.m,
          vertical: AppSpacing.s,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusXL),
        ),
      ),

      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.s,
        ),
        minVerticalPadding: AppSpacing.s,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        ),
      ),

      // Bottom Navigation Bar Theme - Clean white with red accents
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.navigationBackground,
        selectedItemColor: AppColors.navigationSelected, // Red for selected
        unselectedItemColor: AppColors.navigationUnselected,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTypography.navigationLabel.copyWith(
          color: AppColors.navigationSelected,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTypography.navigationLabel.copyWith(
          color: AppColors.navigationUnselected,
        ),
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarThemeData(
        labelColor: primary,
        unselectedLabelColor: AppColors.textSecondary,
        indicatorColor: primary,
        labelStyle: AppTypography.buttonMedium,
        unselectedLabelStyle: AppTypography.buttonMedium,
      ),

      // Divider Theme
      dividerTheme: DividerThemeData(
        color: isDark ? AppColors.neutral700 : AppColors.neutral300,
        thickness: 1,
        space: 1,
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: isDark ? AppColors.neutral300 : AppColors.neutral700,
        size: AppSpacing.iconSize,
      ),

      // Text Theme
      textTheme: _buildTextTheme(isDark),
    );
  }

  static TextTheme _buildTextTheme(bool isDark) {
    final Color textColor =
        isDark ? AppColors.neutral100 : AppColors.textPrimary;
    final Color textColorSecondary =
        isDark ? AppColors.neutral300 : AppColors.textSecondary;

    return TextTheme(
      displayLarge:
          AppTypography.englishDisplayLarge.copyWith(color: textColor),
      headlineLarge:
          AppTypography.englishHeadlineLarge.copyWith(color: textColor),
      titleLarge: AppTypography.englishTitleLarge.copyWith(color: textColor),
      bodyLarge: AppTypography.englishBodyLarge.copyWith(color: textColor),
      bodyMedium: AppTypography.englishBodyMedium.copyWith(color: textColor),
      bodySmall: AppTypography.caption.copyWith(color: textColorSecondary),
      labelLarge: AppTypography.buttonLarge.copyWith(color: textColor),
      labelMedium:
          AppTypography.buttonMedium.copyWith(color: textColorSecondary),
    );
  }
}
