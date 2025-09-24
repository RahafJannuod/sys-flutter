import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Common
  String get appName => _localizedValues[locale.languageCode]?['app_name'] ?? 'Community Marketplace';
  String get ok => _localizedValues[locale.languageCode]?['ok'] ?? 'OK';
  String get cancel => _localizedValues[locale.languageCode]?['cancel'] ?? 'Cancel';
  String get yes => _localizedValues[locale.languageCode]?['yes'] ?? 'Yes';
  String get no => _localizedValues[locale.languageCode]?['no'] ?? 'No';
  String get save => _localizedValues[locale.languageCode]?['save'] ?? 'Save';
  String get delete => _localizedValues[locale.languageCode]?['delete'] ?? 'Delete';
  String get edit => _localizedValues[locale.languageCode]?['edit'] ?? 'Edit';
  String get loading => _localizedValues[locale.languageCode]?['loading'] ?? 'Loading...';
  String get error => _localizedValues[locale.languageCode]?['error'] ?? 'Error';
  String get tryAgain => _localizedValues[locale.languageCode]?['try_again'] ?? 'Try Again';

  // Authentication
  String get signIn => _localizedValues[locale.languageCode]?['sign_in'] ?? 'Sign In';
  String get signUp => _localizedValues[locale.languageCode]?['sign_up'] ?? 'Sign Up';
  String get signOut => _localizedValues[locale.languageCode]?['sign_out'] ?? 'Sign Out';
  String get email => _localizedValues[locale.languageCode]?['email'] ?? 'Email';
  String get password => _localizedValues[locale.languageCode]?['password'] ?? 'Password';
  String get confirmPassword => _localizedValues[locale.languageCode]?['confirm_password'] ?? 'Confirm Password';
  String get forgotPassword => _localizedValues[locale.languageCode]?['forgot_password'] ?? 'Forgot Password?';
  String get signInWithGoogle => _localizedValues[locale.languageCode]?['sign_in_google'] ?? 'Sign in with Google';
  String get signInWithFacebook => _localizedValues[locale.languageCode]?['sign_in_facebook'] ?? 'Sign in with Facebook';
  String get signInWithApple => _localizedValues[locale.languageCode]?['sign_in_apple'] ?? 'Sign in with Apple';
  String get browseAsGuest => _localizedValues[locale.languageCode]?['browse_as_guest'] ?? 'Browse as Guest';

  // Categories
  String get categoryUsedItems => _localizedValues[locale.languageCode]?['category_used_items'] ?? 'Used Items';
  String get categoryHomemadePantry => _localizedValues[locale.languageCode]?['category_homemade_pantry'] ?? 'Homemade Pantry';
  String get categoryHandmadeCrafts => _localizedValues[locale.languageCode]?['category_handmade_crafts'] ?? 'Handmade Crafts';
  String get categoryFreeProducts => _localizedValues[locale.languageCode]?['category_free_products'] ?? 'Free Products';
  String get categoryDeliveryServices => _localizedValues[locale.languageCode]?['category_delivery_services'] ?? 'Delivery Services';

  // Navigation
  String get home => _localizedValues[locale.languageCode]?['home'] ?? 'Home';
  String get chats => _localizedValues[locale.languageCode]?['chats'] ?? 'Chats';
  String get favorites => _localizedValues[locale.languageCode]?['favorites'] ?? 'Favorites';
  String get profile => _localizedValues[locale.languageCode]?['profile'] ?? 'Profile';
  String get yourProducts => _localizedValues[locale.languageCode]?['your_products'] ?? 'Your Products';

  // Product
  String get addProduct => _localizedValues[locale.languageCode]?['add_product'] ?? 'Add Product';
  String get productTitle => _localizedValues[locale.languageCode]?['product_title'] ?? 'Product Title';
  String get productDescription => _localizedValues[locale.languageCode]?['product_description'] ?? 'Product Description';
  String get price => _localizedValues[locale.languageCode]?['price'] ?? 'Price';
  String get free => _localizedValues[locale.languageCode]?['free'] ?? 'Free';
  String get contactSeller => _localizedValues[locale.languageCode]?['contact_seller'] ?? 'Contact Seller';
  String get addToFavorites => _localizedValues[locale.languageCode]?['add_to_favorites'] ?? 'Add to Favorites';
  String get removeFromFavorites => _localizedValues[locale.languageCode]?['remove_from_favorites'] ?? 'Remove from Favorites';

  // Chat
  String get typeMessage => _localizedValues[locale.languageCode]?['type_message'] ?? 'Type a message...';
  String get sendMessage => _localizedValues[locale.languageCode]?['send_message'] ?? 'Send';
  String get noMessages => _localizedValues[locale.languageCode]?['no_messages'] ?? 'No messages yet';

  // Location
  String get selectLocation => _localizedValues[locale.languageCode]?['select_location'] ?? 'Select Location';
  String get currentLocation => _localizedValues[locale.languageCode]?['current_location'] ?? 'Current Location';
  String get nearbyProducts => _localizedValues[locale.languageCode]?['nearby_products'] ?? 'Nearby Products';

  // Error Messages
  String get networkError => _localizedValues[locale.languageCode]?['network_error'] ?? 'Network error occurred';
  String get authenticationError => _localizedValues[locale.languageCode]?['authentication_error'] ?? 'Authentication failed';
  String get permissionDenied => _localizedValues[locale.languageCode]?['permission_denied'] ?? 'Permission denied';

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Community Marketplace',
      'ok': 'OK',
      'cancel': 'Cancel',
      'yes': 'Yes',
      'no': 'No',
      'save': 'Save',
      'delete': 'Delete',
      'edit': 'Edit',
      'loading': 'Loading...',
      'error': 'Error',
      'try_again': 'Try Again',
      'sign_in': 'Sign In',
      'sign_up': 'Sign Up',
      'sign_out': 'Sign Out',
      'email': 'Email',
      'password': 'Password',
      'confirm_password': 'Confirm Password',
      'forgot_password': 'Forgot Password?',
      'sign_in_google': 'Sign in with Google',
      'sign_in_facebook': 'Sign in with Facebook',
      'sign_in_apple': 'Sign in with Apple',
      'browse_as_guest': 'Browse as Guest',
      'category_used_items': 'Used Items',
      'category_homemade_pantry': 'Homemade Pantry',
      'category_handmade_crafts': 'Handmade Crafts',
      'category_free_products': 'Free Products',
      'category_delivery_services': 'Delivery Services',
      'home': 'Home',
      'chats': 'Chats',
      'favorites': 'Favorites',
      'profile': 'Profile',
      'your_products': 'Your Products',
      'add_product': 'Add Product',
      'product_title': 'Product Title',
      'product_description': 'Product Description',
      'price': 'Price',
      'free': 'Free',
      'contact_seller': 'Contact Seller',
      'add_to_favorites': 'Add to Favorites',
      'remove_from_favorites': 'Remove from Favorites',
      'type_message': 'Type a message...',
      'send_message': 'Send',
      'no_messages': 'No messages yet',
      'select_location': 'Select Location',
      'current_location': 'Current Location',
      'nearby_products': 'Nearby Products',
      'network_error': 'Network error occurred',
      'authentication_error': 'Authentication failed',
      'permission_denied': 'Permission denied',
    },
    'ar': {
      'app_name': 'سوق المجتمع',
      'ok': 'موافق',
      'cancel': 'إلغاء',
      'yes': 'نعم',
      'no': 'لا',
      'save': 'حفظ',
      'delete': 'حذف',
      'edit': 'تعديل',
      'loading': 'جاري التحميل...',
      'error': 'خطأ',
      'try_again': 'حاول مرة أخرى',
      'sign_in': 'تسجيل الدخول',
      'sign_up': 'إنشاء حساب',
      'sign_out': 'تسجيل الخروج',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirm_password': 'تأكيد كلمة المرور',
      'forgot_password': 'نسيت كلمة المرور؟',
      'sign_in_google': 'تسجيل الدخول بجوجل',
      'sign_in_facebook': 'تسجيل الدخول بفيسبوك',
      'sign_in_apple': 'تسجيل الدخول بأبل',
      'browse_as_guest': 'تصفح كزائر',
      'category_used_items': 'سلع مستعملة',
      'category_homemade_pantry': 'مؤن منزلية',
      'category_handmade_crafts': 'أشغال يدوية',
      'category_free_products': 'منتجات مجانية',
      'category_delivery_services': 'خدمات التوصيل',
      'home': 'الرئيسية',
      'chats': 'المحادثات',
      'favorites': 'المفضلة',
      'profile': 'الملف الشخصي',
      'your_products': 'منتجاتك',
      'add_product': 'إضافة منتج',
      'product_title': 'عنوان المنتج',
      'product_description': 'وصف المنتج',
      'price': 'السعر',
      'free': 'مجاني',
      'contact_seller': 'التواصل مع البائع',
      'add_to_favorites': 'إضافة للمفضلة',
      'remove_from_favorites': 'إزالة من المفضلة',
      'type_message': 'اكتب رسالة...',
      'send_message': 'إرسال',
      'no_messages': 'لا توجد رسائل بعد',
      'select_location': 'اختر الموقع',
      'current_location': 'الموقع الحالي',
      'nearby_products': 'المنتجات القريبة',
      'network_error': 'حدث خطأ في الشبكة',
      'authentication_error': 'فشل في المصادقة',
      'permission_denied': 'تم رفض الإذن',
    },
  };
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}