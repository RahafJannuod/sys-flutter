class RouteNames {
  RouteNames._();

  // Authentication Flow
  static const String splash = '/';
  static const String authentication = '/auth';

  // Main Navigation
  static const String home = '/home';
  static const String chats = '/chats';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String yourProducts = '/your-products';

  // Detail Screens
  static const String productDetail = '/product';
  static const String chatDetail = '/chat';

  // Form Screens
  static const String addProduct = '/add-product';
  static const String editProduct = '/edit-product';

  // Settings and More
  static const String settings = '/settings';
  static const String about = '/about';
  static const String help = '/help';

  // Modern Design Screen
  static const String modernEcommerce = '/modern-ecommerce';

  // Helper methods for navigation with parameters
  static String productDetailPath(String productId) =>
      '$productDetail/$productId';

  static String chatDetailPath(String chatId) => '$chatDetail/$chatId';

  static String editProductPath(String productId) =>
      '$editProduct/$productId';
}