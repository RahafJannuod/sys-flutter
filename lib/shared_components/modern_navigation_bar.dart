import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';
import 'language_dropdown.dart';
import 'slide_in_menu.dart';

class ModernNavigationBar extends StatefulWidget implements PreferredSizeWidget {
  const ModernNavigationBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<ModernNavigationBar> createState() => _ModernNavigationBarState();
}

class _ModernNavigationBarState extends State<ModernNavigationBar> {
  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
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

              // Language Dropdown
              LanguageDropdown(
                onLanguageChanged: (language) {
                  // Handle language change
                },
              ),

              const Spacer(),

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
              GestureDetector(
                onTap: _toggleMenu,
                child: const Icon(
                  Icons.menu,
                  size: 24,
                  color: AppColors.navBarIcon,
                ),
              ),
            ],
          ),
        ),

        // Slide-in Menu Overlay
        if (_isMenuVisible)
          SlideInMenu(
            isVisible: _isMenuVisible,
            onClose: _closeMenu,
            onProfileTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile tapped')),
              );
            },
            onSettingsTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings tapped')),
              );
            },
            onSignOutTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Sign out tapped')),
              );
            },
          ),
      ],
    );
  }
}