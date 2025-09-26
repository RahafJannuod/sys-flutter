import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/splash/splash_screen.dart';
import '../../screens/auth/authentication_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/product_detail/product_detail_screen.dart';
import '../../screens/chats/chats_screen.dart';
import '../../screens/favorites/favorites_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/your_products/your_products_screen.dart';
import '../../screens/add_product/add_product_screen.dart';
import '../../screens/modern_ecommerce_screen.dart';
import '../../shared_components/bottom_navigation_wrapper.dart';
import 'route_names.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      // Splash Screen
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Authentication Screen
      GoRoute(
        path: RouteNames.authentication,
        name: RouteNames.authentication,
        builder: (context, state) => const AuthenticationScreen(),
      ),

      // Main Shell with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavigationWrapper(child: child);
        },
        routes: [
          // Home Screen (Modern E-commerce Design)
          GoRoute(
            path: RouteNames.home,
            name: RouteNames.home,
            builder: (context, state) => const ModernEcommerceScreen(),
          ),

          // Chats Screen
          GoRoute(
            path: RouteNames.chats,
            name: RouteNames.chats,
            builder: (context, state) => const ChatsScreen(),
          ),

          // Favorites Screen
          GoRoute(
            path: RouteNames.favorites,
            name: RouteNames.favorites,
            builder: (context, state) => const FavoritesScreen(),
          ),

          // Profile Screen
          GoRoute(
            path: RouteNames.profile,
            name: RouteNames.profile,
            builder: (context, state) => const ProfileScreen(),
          ),

          // Your Products Screen
          GoRoute(
            path: RouteNames.yourProducts,
            name: RouteNames.yourProducts,
            builder: (context, state) => const YourProductsScreen(),
          ),
        ],
      ),

      // Product Detail Screen (outside shell for full screen)
      GoRoute(
        path: '${RouteNames.productDetail}/:productId',
        name: RouteNames.productDetail,
        builder: (context, state) {
          final productId = state.pathParameters['productId']!;
          return ProductDetailScreen(productId: productId);
        },
      ),

      // Add Product Screen (outside shell for full screen)
      GoRoute(
        path: RouteNames.addProduct,
        name: RouteNames.addProduct,
        builder: (context, state) => const AddProductScreen(),
      ),

      // Chat Detail Screen (outside shell for full screen)
      GoRoute(
        path: '${RouteNames.chatDetail}/:chatId',
        name: RouteNames.chatDetail,
        builder: (context, state) {
          final chatId = state.pathParameters['chatId']!;
          return ChatDetailScreen(chatId: chatId);
        },
      ),
    ],

    // Global error handling
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),

    // Route redirect logic (e.g., authentication checks)
    redirect: (context, state) {
      // TODO: Implement authentication-based redirects
      // This would check if user is authenticated and redirect accordingly
      return null;
    },
  );

  static GoRouter get router => _router;
}

// Chat Detail Screen placeholder
class ChatDetailScreen extends StatelessWidget {
  final String chatId;

  const ChatDetailScreen({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Center(
        child: Text('Chat Detail: $chatId'),
      ),
    );
  }
}