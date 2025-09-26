import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/localization/app_localizations.dart';
import '../core/routing/route_names.dart';
import '../design_system/colors/app_colors.dart';

class BottomNavigationWrapper extends StatefulWidget {
  final Widget child;

  const BottomNavigationWrapper({super.key, required this.child});

  @override
  State<BottomNavigationWrapper> createState() => _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper> {
  int _selectedIndex = 0;

  static const List<String> _routes = [
    RouteNames.home,
    RouteNames.chats,
    RouteNames.favorites,
    RouteNames.yourProducts,
    RouteNames.profile,
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      context.go(_routes[index]);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    final currentRoute = GoRouterState.of(context).uri.path;
    final index = _routes.indexOf(currentRoute);
    if (index != -1 && index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.neutral600,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home),
              label: localizations.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.chat_bubble_outline),
              activeIcon: const Icon(Icons.chat_bubble),
              label: localizations.chats,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite_border),
              activeIcon: const Icon(Icons.favorite),
              label: localizations.favorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.inventory_outlined),
              activeIcon: const Icon(Icons.inventory),
              label: localizations.yourProducts,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline),
              activeIcon: const Icon(Icons.person),
              label: localizations.profile,
            ),
          ],
        ),
      ),
    );
  }
}