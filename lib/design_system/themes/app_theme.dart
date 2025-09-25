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
      background: background,
      onBackground: isDark ? AppColors.neutral100 : AppColors.textPrimary,
    );

    return ThemeData(
      colorScheme: colorScheme,
      brightness: brightness,
      fontFamily: AppTypography.englishFont,

      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: surface,
        foregroundColor: colorScheme.onSurface,
        elevation: AppSpacing.elevation1,
        centerTitle: false,
        titleTextStyle: AppTypography.englishTitleLarge.copyWith(
          color: colorScheme.onSurface,
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        elevation: AppSpacing.elevation2,
        margin: const EdgeInsets.all(AppSpacing.s),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusL),
        ),
        color: surface,
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: AppColors.textOnPrimary,
          elevation: AppSpacing.elevation2,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          minimumSize: const Size(double.infinity, AppSpacing.minTouchTarget),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          ),
          textStyle: AppTypography.buttonLarge,
        ),
      ),

      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primary,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.m,
          ),
          minimumSize: const Size(double.infinity, AppSpacing.minTouchTarget),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          ),
          side: BorderSide(color: primary),
          textStyle: AppTypography.buttonLarge,
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

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.neutral800 : AppColors.neutral50,
        contentPadding: const EdgeInsets.all(AppSpacing.l),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: BorderSide(color: primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        labelStyle: AppTypography.englishBodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        hintStyle: AppTypography.englishBodyMedium.copyWith(
          color: AppColors.textDisabled,
        ),
      ),

      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: isDark ? AppColors.neutral700 : AppColors.neutral200,
        selectedColor: primary.withOpacity(0.2),
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

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: AppSpacing.elevation8,
      ),

      // Tab Bar Theme
      tabBarTheme: TabBarTheme(
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
    final Color textColor = isDark ? AppColors.neutral100 : AppColors.textPrimary;
    final Color textColorSecondary = isDark ? AppColors.neutral300 : AppColors.textSecondary;

    return TextTheme(
      displayLarge: AppTypography.englishDisplayLarge.copyWith(color: textColor),
      headlineLarge: AppTypography.englishHeadlineLarge.copyWith(color: textColor),
      titleLarge: AppTypography.englishTitleLarge.copyWith(color: textColor),
      bodyLarge: AppTypography.englishBodyLarge.copyWith(color: textColor),
      bodyMedium: AppTypography.englishBodyMedium.copyWith(color: textColor),
      bodySmall: AppTypography.caption.copyWith(color: textColorSecondary),
      labelLarge: AppTypography.buttonLarge.copyWith(color: textColor),
      labelMedium: AppTypography.buttonMedium.copyWith(color: textColorSecondary),
    );
  }
}