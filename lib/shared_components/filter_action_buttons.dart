import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';

class FilterActionButtons extends StatelessWidget {
  final VoidCallback? onClearFilters;
  final VoidCallback? onApplyFilters;

  const FilterActionButtons({
    super.key,
    this.onClearFilters,
    this.onApplyFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.m,
      ),
      child: Row(
        children: [
          // Clear Filters Button (Text Button)
          Expanded(
            child: TextButton(
              onPressed: onClearFilters,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.clearFiltersText,
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.m,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                  side: const BorderSide(
                    color: AppColors.clearFiltersText,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                'Clear Filters',
                style: AppTypography.buttonMedium.copyWith(
                  color: AppColors.clearFiltersText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          const SizedBox(width: AppSpacing.m),

          // Apply Filters Button (Deep Red CTA)
          Expanded(
            child: ElevatedButton(
              onPressed: onApplyFilters,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.applyFiltersBackground,
                foregroundColor: Colors.white,
                elevation: 2,
                padding: const EdgeInsets.symmetric(
                  vertical: AppSpacing.m,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                ),
                shadowColor: AppColors.applyFiltersBackground.withValues(alpha: 0.3),
              ),
              child: Text(
                'Apply Filters',
                style: AppTypography.buttonMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}