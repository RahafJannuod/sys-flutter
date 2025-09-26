import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';

class ModernNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const ModernNavigationBar({super.key});

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

          const SizedBox(width: AppSpacing.s),

          // American Flag Icon
          const Icon(
            Icons.flag,
            size: 20,
            color: AppColors.navBarIcon,
          ),

          const Spacer(),

          // Orange Add Button (Circular)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.orangeButton,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 24,
            ),
          ),

          const SizedBox(width: AppSpacing.m),

          // Chat Icon with Notification Dot
          Stack(
            children: [
              const Icon(
                Icons.chat_bubble_outline,
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
                    color: AppColors.orangeButton,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
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

          // Heart Icon
          const Icon(
            Icons.favorite_border,
            size: 24,
            color: AppColors.navBarIcon,
          ),

          const SizedBox(width: AppSpacing.m),

          // Hamburger Menu
          const Icon(
            Icons.menu,
            size: 24,
            color: AppColors.navBarIcon,
          ),
        ],
      ),
    );
  }
}