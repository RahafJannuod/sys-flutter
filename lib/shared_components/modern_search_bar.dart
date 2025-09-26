import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';

class ModernSearchBar extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;

  const ModernSearchBar({
    super.key,
    this.hintText = 'Search for anything...',
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });

  @override
  State<ModernSearchBar> createState() => _ModernSearchBarState();
}

class _ModernSearchBarState extends State<ModernSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.m,
        vertical: AppSpacing.s,
      ),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        border: Border.all(
          color: AppColors.searchBarBorder,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: AppTypography.searchHint.copyWith(
          color: AppColors.searchBarText,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTypography.searchHint.copyWith(
            color: AppColors.searchBarHint,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.searchBarIcon,
            size: 24,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: AppColors.searchBarIcon,
                    size: 20,
                  ),
                  onPressed: () {
                    _controller.clear();
                    if (widget.onChanged != null) {
                      widget.onChanged!('');
                    }
                    setState(() {});
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.m,
            vertical: AppSpacing.m,
          ),
        ),
        onTap: () => setState(() {}),
      ),
    );
  }
}