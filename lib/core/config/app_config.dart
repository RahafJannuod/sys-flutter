import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();

  // App Information
  static const String appName = 'Community Marketplace';
  static const String appVersion = '1.0.0';
  static const String buildNumber = '1';

  // Supported Locales
  static const List<Locale> supportedLocales = [
    Locale('ar', 'SA'), // Arabic (Saudi Arabia) - Default
    Locale('en', 'US'), // English (United States)
  ];

  // Default Locale
  static const Locale defaultLocale = Locale('ar', 'SA');

  // API Configuration
  static const String baseApiUrl = 'https://api.communitymarketplace.com';
  static const String websocketUrl = 'wss://ws.communitymarketplace.com';

  // Microservice Endpoints
  static const Map<String, String> serviceEndpoints = {
    'user': '/user-service',
    'product': '/product-service',
    'chat': '/chat-service',
    'location': '/location-service',
    'payment': '/payment-service',
    'notification': '/notification-service',
    'file': '/file-service',
    'delivery': '/delivery-service',
  };

  // App Settings
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const int chatMessageLimit = 100;
  static const double maxSearchRadius = 50.0; // km
  static const int productListPageSize = 20;

  // Feature Flags
  static const bool enableDarkMode = true;
  static const bool enablePushNotifications = true;
  static const bool enableCaching = true;
  static const bool enableAnalytics = true;

  // Image Quality Settings
  static const Map<String, int> imageQuality = {
    'thumbnail': 50,
    'medium': 75,
    'high': 90,
  };

  // Cache Settings
  static const Duration cacheExpiration = Duration(hours: 24);
  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB

  // Performance Settings
  static const Duration networkTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 10);

  // Product Categories
  static const List<ProductCategory> productCategories = [
    ProductCategory(
      id: 'used_items',
      nameKey: 'category_used_items',
      icon: '🛒',
      colorKey: 'used_items',
    ),
    ProductCategory(
      id: 'homemade_pantry',
      nameKey: 'category_homemade_pantry',
      icon: '🧺',
      colorKey: 'homemade_pantry',
    ),
    ProductCategory(
      id: 'handmade_crafts',
      nameKey: 'category_handmade_crafts',
      icon: '🧶',
      colorKey: 'handmade_crafts',
    ),
    ProductCategory(
      id: 'free_products',
      nameKey: 'category_free_products',
      icon: '🎁',
      colorKey: 'free_products',
    ),
    ProductCategory(
      id: 'delivery_services',
      nameKey: 'category_delivery_services',
      icon: '🚚',
      colorKey: 'delivery_services',
      isComingSoon: true,
    ),
  ];
}

class ProductCategory {
  const ProductCategory({
    required this.id,
    required this.nameKey,
    required this.icon,
    required this.colorKey,
    this.isComingSoon = false,
  });

  final String id;
  final String nameKey;
  final String icon;
  final String colorKey;
  final bool isComingSoon;
}