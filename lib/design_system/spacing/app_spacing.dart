class AppSpacing {
  AppSpacing._();

  // Base spacing unit (4dp grid system)
  static const double _unit = 4.0;

  // Spacing values
  static const double xs = _unit; // 4dp
  static const double s = _unit * 2; // 8dp
  static const double m = _unit * 3; // 12dp
  static const double l = _unit * 4; // 16dp
  static const double xl = _unit * 5; // 20dp
  static const double xxl = _unit * 6; // 24dp
  static const double xxxl = _unit * 8; // 32dp
  static const double xxxxl = _unit * 10; // 40dp
  static const double xxxxxl = _unit * 12; // 48dp

  // Semantic spacing
  static const double minTouchTarget = 48.0; // Minimum touch target size
  static const double cardPadding = l; // Standard card padding
  static const double screenPadding = l; // Standard screen padding
  static const double listItemPadding = l; // List item padding
  static const double buttonPadding = m; // Button internal padding
  static const double inputPadding = l; // Input field padding

  // Section spacing
  static const double sectionSpacing = xxl; // Between major sections
  static const double itemSpacing = m; // Between related items
  static const double elementSpacing = s; // Between UI elements

  // Border radius
  static const double radiusS = _unit; // 4dp - small elements
  static const double radiusM = _unit * 2; // 8dp - buttons, inputs
  static const double radiusL = _unit * 3; // 12dp - cards
  static const double radiusXL = _unit * 4; // 16dp - sheets, dialogs
  static const double radiusXXL = _unit * 6; // 24dp - large containers

  // Elevation levels (Material Design)
  static const double elevation0 = 0.0;
  static const double elevation1 = 1.0;
  static const double elevation2 = 2.0;
  static const double elevation3 = 3.0;
  static const double elevation4 = 4.0;
  static const double elevation6 = 6.0;
  static const double elevation8 = 8.0;
  static const double elevation12 = 12.0;
  static const double elevation16 = 16.0;
  static const double elevation24 = 24.0;

  // Common spacing methods
  static double get zero => 0.0;
  static double get tiny => xs;
  static double get small => s;
  static double get medium => m;
  static double get large => l;
  static double get extraLarge => xl;
  static double get huge => xxxl;

  // Custom spacing for specific use cases
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 60.0;
  static const double tabBarHeight = 48.0;
  static const double floatingActionButtonMargin = l;
  static const double listTileVerticalPadding = s;
  static const double dialogPadding = xxl;
  static const double chipPadding = m;
  static const double avatarRadius = 20.0;
  static const double iconSize = 24.0;
  static const double iconSizeSmall = 16.0;
  static const double iconSizeLarge = 32.0;
}