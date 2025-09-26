import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';

class ModernFilterDropdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;
  final IconData? prefixIcon;

  const ModernFilterDropdown({
    super.key,
    required this.hint,
    required this.items,
    this.value,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.dropdownBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusS),
        border: Border.all(
          color: AppColors.dropdownBorder,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        hint: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                size: 16,
                color: AppColors.dropdownIcon,
              ),
              const SizedBox(width: AppSpacing.xs),
            ],
            Flexible(
              child: Text(
                hint,
                style: AppTypography.filterButton.copyWith(
                  color: AppColors.dropdownText,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  Icon(
                    prefixIcon,
                    size: 16,
                    color: AppColors.dropdownIcon,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                ],
                Flexible(
                  child: Text(
                    item,
                    style: AppTypography.filterButton.copyWith(
                      color: AppColors.dropdownText,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppSpacing.m,
            vertical: AppSpacing.s,
          ),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.dropdownIcon,
          size: 20,
        ),
        dropdownColor: AppColors.dropdownBackground,
        style: AppTypography.filterButton.copyWith(
          color: AppColors.dropdownText,
        ),
        isExpanded: true,
      ),
    );
  }
}

class FilterDropdownRow extends StatelessWidget {
  final List<Widget> dropdowns;

  const FilterDropdownRow({
    super.key,
    required this.dropdowns,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        children: dropdowns.asMap().entries.map((entry) {
          final index = entry.key;
          final dropdown = entry.value;

          return Expanded(
            child: Container(
              margin: EdgeInsets.only(
                right: index < dropdowns.length - 1 ? AppSpacing.s : 0,
              ),
              child: dropdown,
            ),
          );
        }).toList(),
      ),
    );
  }
}