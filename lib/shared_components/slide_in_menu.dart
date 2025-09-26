import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/spacing/app_spacing.dart';
import '../design_system/typography/app_typography.dart';

class SlideInMenu extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onClose;
  final VoidCallback? onProfileTap;
  final VoidCallback? onSettingsTap;
  final VoidCallback? onSignOutTap;

  const SlideInMenu({
    super.key,
    required this.isVisible,
    required this.onClose,
    this.onProfileTap,
    this.onSettingsTap,
    this.onSignOutTap,
  });

  @override
  State<SlideInMenu> createState() => _SlideInMenuState();
}

class _SlideInMenuState extends State<SlideInMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didUpdateWidget(SlideInMenu oldWidget) {
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
            color: Colors.black.withValues(alpha: 0.5),
          ),
        ),

        // Slide-in menu
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: SlideTransition(
            position: _slideAnimation,
            child: Container(
              width: 280,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(-2, 0),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with Menu title and X close button
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.l),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menu',
                            style: AppTypography.englishTitleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onClose,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider
                    Container(
                      height: 1,
                      color: AppColors.neutral200,
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.l,
                      ),
                    ),

                    const SizedBox(height: AppSpacing.l),

                    // Menu Items
                    Expanded(
                      child: Column(
                        children: [
                          // Profile Item
                          _MenuItemWidget(
                            icon: Icons.person_outline,
                            title: 'Profile',
                            onTap: () {
                              widget.onProfileTap?.call();
                              widget.onClose();
                            },
                          ),

                          // Settings Item
                          _MenuItemWidget(
                            icon: Icons.settings_outlined,
                            title: 'Settings',
                            onTap: () {
                              widget.onSettingsTap?.call();
                              widget.onClose();
                            },
                          ),

                          const Spacer(),

                          // Sign Out Item (at bottom, styled differently)
                          _MenuItemWidget(
                            title: 'Sign Out',
                            onTap: () {
                              widget.onSignOutTap?.call();
                              widget.onClose();
                            },
                            isSignOut: true,
                          ),

                          const SizedBox(height: AppSpacing.xl),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuItemWidget extends StatefulWidget {
  final IconData? icon;
  final String title;
  final VoidCallback? onTap;
  final bool isSignOut;

  const _MenuItemWidget({
    this.icon,
    required this.title,
    this.onTap,
    this.isSignOut = false,
  });

  @override
  State<_MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<_MenuItemWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: AppSpacing.xs,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.m,
          vertical: AppSpacing.l,
        ),
        decoration: BoxDecoration(
          color: _isPressed
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
                size: 24,
                color: AppColors.neutral600,
              ),
              const SizedBox(width: AppSpacing.m),
            ] else if (!widget.isSignOut) ...[
              const SizedBox(width: 24 + AppSpacing.m), // Space for missing icon
            ],

            // Title text
            Expanded(
              child: Text(
                widget.title,
                style: AppTypography.englishBodyLarge.copyWith(
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
    );
  }
}