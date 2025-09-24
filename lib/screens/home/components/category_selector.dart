import 'package:flutter/material.dart';

import '../../../core/config/app_config.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../design_system/colors/app_colors.dart';
import '../../../design_system/spacing/app_spacing.dart';
import '../../../design_system/typography/app_typography.dart';

class CategorySelector extends StatelessWidget {
  final List<ProductCategory> categories;
  final String? selectedCategory;
  final Function(String?) onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        itemCount: categories.length + 1, // +1 for "All" category
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All" category
            return _CategoryCard(
              icon: '📋',
              label: 'All',
              isSelected: selectedCategory == null,
              isComingSoon: false,
              onTap: () => onCategorySelected(null),
            );
          }

          final category = categories[index - 1];
          return _CategoryCard(
            icon: category.icon,
            label: _getCategoryLabel(localizations, category),
            isSelected: selectedCategory == category.id,
            isComingSoon: category.isComingSoon,
            onTap: category.isComingSoon
                ? null
                : () => onCategorySelected(category.id),
          );
        },
      ),
    );
  }

  String _getCategoryLabel(AppLocalizations localizations, ProductCategory category) {
    switch (category.id) {
      case 'used_items':
        return localizations.categoryUsedItems;
      case 'homemade_pantry':
        return localizations.categoryHomemadePantry;
      case 'handmade_crafts':
        return localizations.categoryHandmadeCrafts;
      case 'free_products':
        return localizations.categoryFreeProducts;
      case 'delivery_services':
        return localizations.categoryDeliveryServices;
      default:
        return category.id;
    }
  }
}

class _CategoryCard extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final bool isComingSoon;
  final VoidCallback? onTap;

  const _CategoryCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isComingSoon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: AppSpacing.m),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : (isComingSoon
                        ? AppColors.neutral200
                        : AppColors.neutral100),
                borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                border: isSelected
                    ? null
                    : Border.all(color: AppColors.neutral300),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    icon,
                    style: TextStyle(
                      fontSize: 28,
                      color: isComingSoon ? AppColors.neutral500 : null,
                    ),
                  ),
                  if (isComingSoon)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: AppColors.warning,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              label,
              style: AppTypography.caption.copyWith(
                color: isSelected
                    ? AppColors.primary
                    : (isComingSoon
                        ? AppColors.neutral500
                        : AppColors.textSecondary),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (isComingSoon)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  'Soon',
                  style: AppTypography.overline.copyWith(
                    color: AppColors.warning,
                    fontSize: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}