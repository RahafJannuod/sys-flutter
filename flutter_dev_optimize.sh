#!/bin/bash

echo "🚀 Flutter Development Optimizer"
echo "================================"

# Change to project directory
cd /Users/rahafjannuod/Documents/SYS-flutter

echo "📁 Current directory: $(pwd)"
echo

# 1. Pre-build native dependencies for faster subsequent builds
echo "🔧 Pre-building native dependencies..."
echo "Building Android dependencies..."
cd android && ./gradlew assembleDebug --parallel --daemon && cd ..

# 2. Clean build cache only if needed (avoid unnecessary cleans)
echo "🧹 Checking if clean is needed..."
if [ ! -d ".dart_tool" ] || [ ! -d "build" ]; then
    echo "Performing one-time clean and setup..."
    flutter clean
    flutter pub get
else
    echo "✅ Build cache exists, skipping clean"
fi

# 3. Get dependencies with better caching
echo "📦 Optimizing dependencies..."
flutter pub get --offline || flutter pub get

# 4. Pre-compile for faster startup
echo "⚡ Pre-compiling for faster builds..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "🎯 Optimization complete!"
echo
echo "🚀 Fast Development Commands:"
echo "================================"
echo "Start with hot reload: flutter run --hot"
echo "Start with shader caching: flutter run --cache-sksl"
echo "Start on physical device: flutter run -d <device_id>"
echo "Profile mode: flutter run --profile"
echo
echo "💡 Development Tips:"
echo "- Use 'r' for hot reload (fastest)"
echo "- Use 'R' for hot restart"
echo "- Use 'p' to toggle debug painting"
echo "- Use 'o' to toggle platform"
echo "