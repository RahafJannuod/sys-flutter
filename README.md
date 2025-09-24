# Community Marketplace App

A cross-platform Flutter application for a community-driven marketplace that enables users to buy, sell, give away items, and offer delivery services. Initially targeting the Syrian community with expansion plans to the broader Arab world and eventually global markets.

## 🚀 Quick Start

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation Commands (One-Command Setup)

```bash
# Clone the repository
git clone <repository-url>
cd community_marketplace

# Install dependencies
flutter pub get

# Generate code (for models, services, etc.)
flutter pub run build_runner build

# Run the app
flutter run
```

### Running on Different Platforms

```bash
# Run on Android
flutter run -d android

# Run on iOS (macOS only)
flutter run -d ios

# Run on Web
flutter run -d chrome

# Run on specific device
flutter devices  # List available devices
flutter run -d <device_id>
```

### Environment Configuration

Create environment configuration files:

```bash
# Development
cp .env.example .env.development

# Production
cp .env.example .env.production

# Staging
cp .env.example .env.staging
```

Configure your API endpoints and keys in the respective environment files.

## 🏗️ Development Guide

### Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── config/             # App configuration
│   ├── localization/       # Internationalization
│   ├── routing/            # Navigation setup
│   └── utils/              # Utility functions
├── design_system/          # Design system
│   ├── colors/            # Color definitions
│   ├── typography/        # Text styles
│   ├── spacing/           # Spacing constants
│   ├── components/        # Reusable UI components
│   └── themes/            # App themes
├── services/              # API and external services
│   ├── base/              # Base service classes
│   ├── user_service.dart  # User authentication
│   ├── product_service.dart # Product management
│   └── ...                # Other microservices
├── blocs/                 # State management (BLoC)
│   ├── auth/              # Authentication state
│   ├── products/          # Products state
│   └── ...                # Other feature states
├── models/                # Data models
├── screens/               # App screens
│   ├── splash/            # Splash screen
│   ├── auth/              # Authentication
│   ├── home/              # Home screen
│   └── ...                # Other screens
├── shared_components/     # Cross-screen widgets
└── main.dart             # App entry point
```

### Design System Usage

The app uses a comprehensive design system for consistency:

```dart
// Using colors
import '../design_system/colors/app_colors.dart';
Container(color: AppColors.primary)

// Using typography
import '../design_system/typography/app_typography.dart';
Text('Hello', style: AppTypography.englishHeadlineLarge)

// Using spacing
import '../design_system/spacing/app_spacing.dart';
Padding(padding: EdgeInsets.all(AppSpacing.l))
```

### Adding New Features

1. **Create the feature directory** in `lib/screens/`
2. **Add BLoC if needed** in `lib/blocs/`
3. **Create models** in `lib/models/`
4. **Add service methods** in respective service files
5. **Register routes** in `lib/core/routing/app_router.dart`
6. **Add localization strings** in `lib/core/localization/`

Example: Adding a new feature
```dart
// 1. Create BLoC
class NewFeatureBloc extends Bloc<NewFeatureEvent, NewFeatureState> {
  // Implementation
}

// 2. Register in ServiceLocator
serviceLocator.registerFactory<NewFeatureBloc>(
  () => NewFeatureBloc(service: serviceLocator<SomeService>()),
);

// 3. Add route
GoRoute(
  path: '/new-feature',
  name: 'new-feature',
  builder: (context, state) => const NewFeatureScreen(),
),
```

### Testing Procedures

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widgets/

# Run integration tests
flutter test test/integration/

# Run tests with coverage
flutter test --coverage
lcov --list coverage/lcov.info
```

### Code Quality

```bash
# Analyze code
flutter analyze

# Format code
dart format .

# Fix common issues
dart fix --apply
```

## 🚀 Deployment

### Build Processes

#### Android
```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release

# App Bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS
```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release

# Archive for App Store
flutter build ipa --release
```

#### Web
```bash
# Build for web
flutter build web --release
```

### Environment Configurations

The app supports multiple environments:

- **Development**: `--flavor development`
- **Staging**: `--flavor staging`
- **Production**: `--flavor production`

```bash
# Build with specific flavor
flutter build apk --release --flavor production -t lib/main_production.dart
```

### Store Submission Guidelines

#### Android Play Store
1. Build app bundle: `flutter build appbundle --release`
2. Test on multiple devices
3. Prepare store listing (screenshots, descriptions)
4. Upload to Play Console
5. Complete release rollout

#### iOS App Store
1. Build archive: `flutter build ipa --release`
2. Upload via Xcode or Transporter
3. Complete App Store Connect information
4. Submit for review

## 🤝 Contributing

### Code Standards

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable and function names
- Add documentation for public APIs
- Write tests for new features
- Follow the existing project structure

### Pull Request Process

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### Pull Request Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
- [ ] Unit tests pass
- [ ] Widget tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-review completed
- [ ] Documentation updated
- [ ] No new warnings
```

### Issue Reporting

When reporting issues, please include:

1. **Device information** (OS version, Flutter version)
2. **Steps to reproduce** the issue
3. **Expected behavior**
4. **Actual behavior**
5. **Screenshots** if applicable
6. **Logs** if relevant

Use our issue template:

```markdown
**Bug Description**
A clear description of the bug

**To Reproduce**
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected Behavior**
What should happen

**Screenshots**
If applicable

**Environment**
- Device: [e.g. iPhone 12, Pixel 5]
- OS: [e.g. iOS 15.0, Android 11]
- Flutter Version: [e.g. 3.13.0]
- App Version: [e.g. 1.0.0]
```

## 📱 Features

### Core Features
- ✅ Multi-language support (Arabic, English)
- ✅ Cross-platform (iOS, Android, Web)
- ✅ Modern UI with Material Design 3
- ✅ Microservices architecture
- ✅ State management with BLoC
- ✅ Offline capability
- ✅ Image optimization

### Product Categories
- 🛒 **Used Items** - Pre-owned products
- 🧺 **Homemade Pantry** - Home-made food items
- 🧶 **Handmade Crafts** - Artisan products
- 🎁 **Free Products** - Items given away for free
- 🚚 **Delivery Services** - Coming soon

### Upcoming Features
- [ ] Real-time chat system
- [ ] Payment integration
- [ ] Advanced search and filters
- [ ] User ratings and reviews
- [ ] Push notifications
- [ ] Delivery tracking

## 🔒 Security

- All API communications use HTTPS
- User data is encrypted at rest
- Authentication tokens are securely stored
- Image uploads are automatically scanned
- User privacy settings are GDPR compliant

## 📊 Performance

- App loads in <3 seconds on 2G connections
- Images are optimized with multiple resolutions
- Lazy loading implemented throughout
- Local caching for frequently accessed data
- Efficient state management

## 🌍 Internationalization

The app supports:
- **Arabic** (default) - RTL layout support
- **English** - LTR layout support
- Date and number formatting per locale
- Cultural adaptations for imagery and content

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

- **Documentation**: [Wiki](wiki-url)
- **Issues**: [GitHub Issues](issues-url)
- **Discussions**: [GitHub Discussions](discussions-url)
- **Email**: support@communitymarketplace.com

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Material Design for design guidelines
- Community contributors and testers
- Syrian community for inspiration and feedback

---

**Made with ❤️ for community empowerment**