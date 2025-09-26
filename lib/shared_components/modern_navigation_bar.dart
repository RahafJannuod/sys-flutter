import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';
import 'language_dropdown.dart';

class ModernNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;

  const ModernNavigationBar({
    super.key,
    this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.navBarBackground,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // SYS Logo
          Text(
            'SYS',
            style: AppTypography.logoText.copyWith(
              color: AppColors.navBarText,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const Spacer(),

          // Language Dropdown
          LanguageDropdown(
            onLanguageChanged: (language) {
              // Handle language change
            },
          ),

          const SizedBox(width: AppSpacing.m),

          // Bell Icon with Red Notification Dot
          Stack(
            children: [
              const Icon(
                Icons.notifications_none,
                size: 24,
                color: AppColors.navBarIcon,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.notificationDot,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: AppSpacing.m),

          // Hamburger Menu
          GestureDetector(
            onTap: onMenuTap,
            child: const Icon(
              Icons.menu,
              size: 24,
              color: AppColors.navBarIcon,
            ),
          ),
        ],
      ),
    );
  }
}