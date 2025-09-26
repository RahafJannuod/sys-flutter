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
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
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
                  _LocationLabel(localizations: localizations),
                  const _LocationText(),
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

// Optimized const widgets for faster rebuilds
class _LocationLabel extends StatelessWidget {
  final AppLocalizations localizations;

  const _LocationLabel({required this.localizations});

  @override
  Widget build(BuildContext context) {
    return Text(
      localizations.currentLocation,
      style: AppTypography.caption.copyWith(
        color: AppColors.primary,
      ),
    );
  }
}

class _LocationText extends StatelessWidget {
  const _LocationText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Damascus, Syria', // TODO: Get actual location
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
