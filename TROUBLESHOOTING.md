# 🔧 Troubleshooting Guide - Community Marketplace App

## 🚨 App Not Showing on Emulator?

### Step 1: Check Flutter Installation
```bash
flutter --version
flutter doctor -v
```

### Step 2: Verify Project Setup
```bash
cd /Users/rahafjannuod/Documents/SYS-flutter
flutter pub get
flutter pub deps
```

### Step 3: Check Available Devices
```bash
flutter devices
```
You should see something like:
```
• iPhone 15 Pro (mobile) • ios
• Android SDK built for arm64 (mobile) • android
• Chrome (web) • chrome
```

### Step 4: Clean and Rebuild
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 5: Run with Specific Device
```bash
# iOS Simulator
flutter run -d ios

# Android Emulator
flutter run -d android

# Web Browser
flutter run -d chrome
```

## 🔍 Common Issues & Solutions

### Issue 1: "No devices found"
**Solution:**
- **iOS**: Open Xcode → Window → Devices and Simulators → Create simulator
- **Android**: Open Android Studio → AVD Manager → Create Virtual Device

### Issue 2: "Build failed" or compilation errors
**Solution:**
```bash
flutter clean
rm -rf .dart_tool/
flutter pub get
flutter pub run build_runner build
```

### Issue 3: "App installs but crashes immediately"
**Check the console output for errors:**
```bash
flutter run --verbose
```

### Issue 4: White/blank screen on startup
**Possible causes:**
- Routing configuration issue
- BLoC provider setup issue
- Service locator initialization failure

**Debug steps:**
1. Check console for error messages
2. Add debug prints in main.dart
3. Verify splash screen route is working

### Issue 5: Hot reload not working
```bash
flutter run --hot
# Press 'r' to hot reload
# Press 'R' to hot restart
```

## 🐛 Debug Commands

### Run with verbose output
```bash
flutter run --verbose
```

### Run in debug mode with logging
```bash
flutter run --debug --enable-software-rendering
```

### Check for analysis issues
```bash
flutter analyze
dart fix --dry-run
```

### Profile mode (for performance testing)
```bash
flutter run --profile
```

## 📱 Emulator-Specific Issues

### iOS Simulator
- Ensure Xcode Command Line Tools are installed
- Reset simulator: Device → Erase All Content and Settings
- Check iOS version compatibility

### Android Emulator
- Verify Android SDK is properly installed
- Check AVD has enough RAM allocated (4GB minimum)
- Enable hardware acceleration if available
- Try cold boot: AVD Manager → Wipe Data

### Web Browser
- Clear browser cache
- Disable browser extensions
- Try incognito/private mode

## 🛠️ Manual Run Steps

If the automated script doesn't work, try these manual steps:

1. **Terminal 1 - Start Emulator:**
```bash
# iOS
open -a Simulator

# Android
emulator -avd YOUR_AVD_NAME
```

2. **Terminal 2 - Run Flutter:**
```bash
cd /Users/rahafjannuod/Documents/SYS-flutter
flutter pub get
flutter run
```

## 📊 Expected App Flow

When the app runs successfully, you should see:

1. **Splash Screen** (2 seconds)
   - Community Marketplace logo
   - Loading indicator
   - Version info at bottom

2. **Authentication Screen**
   - Login/Register forms
   - Social login buttons
   - "Browse as Guest" option

3. **Home Screen** (after guest login)
   - Location header
   - Search bar
   - Product categories (horizontal scroll)
   - Product grid (placeholder)
   - Bottom navigation bar

## 📞 Getting Help

If you're still having issues:

1. **Check the console output** for specific error messages
2. **Run flutter doctor** and fix any issues shown
3. **Try running on web first** (usually more straightforward): `flutter run -d chrome`
4. **Check Flutter version**: Make sure you're using Flutter 3.0+

## 🎯 Quick Test Commands

Run these commands to verify everything is working:

```bash
# Check if project is valid Flutter app
flutter analyze

# Check dependencies
flutter pub deps

# Check devices
flutter devices

# Try web first (easiest to debug)
flutter run -d chrome

# Then try mobile
flutter run
```

The app should load within 10-15 seconds on the emulator. If it takes longer or doesn't appear, check the terminal output for error messages.