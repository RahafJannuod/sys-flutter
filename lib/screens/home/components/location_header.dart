import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../design_system/colors/app_colors.dart';
import '../../../design_system/spacing/app_spacing.dart';
import '../../../design_system/typography/app_typography.dart';

class LocationHeader extends StatelessWidget {
  final VoidCallback onLocationTap;

  const LocationHeader({super.key, required this.onLocationTap});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return InkWell(
      onTap: onLocationTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusM),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.m),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.location_on,
              color: AppColors.primary,
              size: AppSpacing.iconSizeSmall,
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.currentLocation,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Damascus, Syria', // TODO: Get actual location
                    style: AppTypography.englishBodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.primary,
              size: AppSpacing.iconSize,
            ),
          ],
        ),
      ),
    );
  }
}