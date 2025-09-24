#!/bin/bash

echo "🚀 Community Marketplace App - Debug Runner"
echo "==========================================="

# Change to project directory
cd /Users/rahafjannuod/Documents/SYS-flutter

echo "📁 Current directory: $(pwd)"
echo

# Check if Flutter is available
echo "🔍 Checking Flutter installation..."
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter command not found!"
    echo "Please make sure Flutter is installed and added to your PATH"
    echo "Visit: https://docs.flutter.dev/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"
echo

# Check Flutter doctor
echo "🩺 Running Flutter doctor..."
flutter doctor -v
echo

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get
echo

# Check available devices
echo "📱 Available devices:"
flutter devices
echo

# Offer device selection
echo "🎯 Select how to run the app:"
echo "1. iOS Simulator"
echo "2. Android Emulator"
echo "3. Chrome (Web)"
echo "4. Auto-select device"
echo
echo "Choose option (1-4): "
read -r choice

case $choice in
    1)
        echo "🍎 Starting iOS Simulator..."
        flutter run -d ios
        ;;
    2)
        echo "🤖 Starting Android Emulator..."
        flutter run -d android
        ;;
    3)
        echo "🌐 Starting Chrome Web..."
        flutter run -d chrome
        ;;
    4)
        echo "🔄 Auto-selecting device..."
        flutter run
        ;;
    *)
        echo "❌ Invalid choice. Running on default device..."
        flutter run
        ;;
esac