import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/spacing/app_spacing.dart';
import '../design_system/typography/app_typography.dart';

class HamburgerDropdown extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onClose;
  final VoidCallback? onProfileTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onSignOutTap;

  const HamburgerDropdown({
    super.key,
    required this.isVisible,
    required this.onClose,
    this.onProfileTap,
    this.onSettingsTap,
    this.onSignOutTap,
  });

  @override
  State<HamburgerDropdown> createState() => _HamburgerDropdownState();
}

class _HamburgerDropdownState extends State<HamburgerDropdown>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutQuart,
    ));
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void didUpdateWidget(HamburgerDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isVisible) return const SizedBox.shrink();

    return Stack(
      children: [
        // Background overlay
        GestureDetector(
          onTap: widget.onClose,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
          ),
        ),

        // Dropdown positioned from top-right
        Positioned(
          top: kToolbarHeight + 8, // Below the AppBar
          right: 16,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                alignment: Alignment.topRight,
                child: Opacity(
                  opacity: _opacityAnimation.value,
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                    shadowColor: Colors.black.withValues(alpha: 0.15),
                    child: Container(
                      width: 200,
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
                        children: [
                          // Profile Option
                          _DropdownItem(
                            icon: Icons.person_outline,
                            title: 'Profile',
                            onTap: () {
                              widget.onProfileTap?.call();
                              widget.onClose();
                            },
                          ),

                          // Divider
                          Container(
                            height: 1,
                            color: AppColors.neutral200,
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.m,
                            ),
                          ),

                          // Settings Option
                          _DropdownItem(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                            onTap: () {
                              widget.onSettingsTap?.call();
                              widget.onClose();
                            },
                          ),

                          // Divider
                          Container(
                            height: 1,
                            color: AppColors.neutral200,
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.m,
                            ),
                          ),

                          // Sign Out Option (styled differently)
                          _DropdownItem(
                            title: 'Sign Out',
                            onTap: () {
                              widget.onSignOutTap?.call();
                              widget.onClose();
                            },
                            isSignOut: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _DropdownItem extends StatefulWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onTap;
  final bool isSignOut;

  const _DropdownItem({
    this.icon,
    required this.title,
    this.onTap,
    this.isSignOut = false,
  });

  @override
  State<_DropdownItem> createState() => _DropdownItemState();
}

class _DropdownItemState extends State<_DropdownItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.m,
            vertical: AppSpacing.m,
          ),
          decoration: BoxDecoration(
            color: _isHovered
              ? AppColors.neutral100
              : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.radiusS),
          ),
          child: Row(
            children: [
              // Icon (only for non-sign-out items)
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 20,
                  color: AppColors.neutral600,
                ),
                const SizedBox(width: AppSpacing.s),
              ],

              // Title text
              Expanded(
                child: Text(
                  widget.title,
                  style: AppTypography.englishBodyMedium.copyWith(
                    color: widget.isSignOut
                      ? AppColors.error
                      : AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}