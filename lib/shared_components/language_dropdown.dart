import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/spacing/app_spacing.dart';
import '../design_system/typography/app_typography.dart';

class LanguageDropdown extends StatefulWidget {
  final String? selectedLanguage;
  final ValueChanged<String>? onLanguageChanged;

  const LanguageDropdown({
    super.key,
    this.selectedLanguage,
    this.onLanguageChanged,
  });

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  String _selectedLanguage = 'English';
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isOpen = false;

  final List<Map<String, String>> _languages = [
    {'name': 'English', 'flag': '🇺🇸'},
    {'name': 'العربية', 'flag': '🇸🇦'},
    {'name': 'Español', 'flag': '🇪🇸'},
    {'name': 'Français', 'flag': '🇫🇷'},
    {'name': 'Deutsch', 'flag': '🇩🇪'},
    {'name': '中文', 'flag': '🇨🇳'},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.selectedLanguage != null) {
      _selectedLanguage = widget.selectedLanguage!;
    }
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx - 120, // Adjust to center the dropdown
        top: offset.dy + size.height + 8,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
            shadowColor: Colors.black.withValues(alpha: 0.15),
            child: Container(
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                border: Border.all(
                  color: AppColors.neutral200,
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _languages.map((language) {
                  final isSelected = language['name'] == _selectedLanguage;
                  return InkWell(
                    onTap: () {
                      _selectLanguage(language['name']!);
                    },
                    borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.m,
                        vertical: AppSpacing.s,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.05)
                          : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                      ),
                      child: Row(
                        children: [
                          // Flag Icon
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                language['flag']!,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),

                          const SizedBox(width: AppSpacing.s),

                          // Language Name
                          Expanded(
                            child: Text(
                              language['name']!,
                              style: AppTypography.englishBodyMedium.copyWith(
                                color: isSelected
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                                fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              ),
                            ),
                          ),

                          // Selected Indicator
                          if (isSelected)
                            const Icon(
                              Icons.check,
                              size: 16,
                              color: AppColors.primary,
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
    widget.onLanguageChanged?.call(language);
    _closeDropdown();
  }

  String _getCurrentFlag() {
    final currentLang = _languages.firstWhere(
      (lang) => lang['name'] == _selectedLanguage,
      orElse: () => _languages.first,
    );
    return currentLang['flag']!;
  }

  @override
  void dispose() {
    _closeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSpacing.radiusS),
            border: Border.all(
              color: _isOpen ? AppColors.primary : AppColors.neutral300,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Current Flag
              Text(
                _getCurrentFlag(),
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(width: 4),

              // Dropdown Arrow
              AnimatedRotation(
                turns: _isOpen ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}