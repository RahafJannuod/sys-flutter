#!/bin/bash

# Quick Run Script for Flutter Development

cd /Users/rahafjannuod/Documents/SYS-flutter

echo "🚀 Quick Flutter Runner"
echo "======================="
echo
echo "Choose your development mode:"
echo "1. 🔥 Hot Reload Mode (fastest for development)"
echo "2. ⚡ Shader Cache Mode (good for UI testing)"
echo "3. 📱 Physical Device (fastest performance)"
echo "4. 🌐 Web Development (instant reload)"
echo "5. 🔧 Profile Mode (performance testing)"
echo "6. 📊 Debug with Inspector"
echo
read -p "Enter choice (1-6): " choice

case $choice in
    1)
        echo "🔥 Starting with Hot Reload..."
        flutter run --hot
        ;;
    2)
        echo "⚡ Starting with Shader Cache..."
        flutter run --cache-sksl --hot
        ;;
    3)
        echo "📱 Available devices:"
        flutter devices
        echo
        read -p "Enter device ID: " device_id
        flutter run -d "$device_id" --hot
        ;;
    4)
        echo "🌐 Starting Web Development..."
        flutter run -d chrome --web-port 8080 --hot
        ;;
    5)
        echo "🔧 Starting Profile Mode..."
        flutter run --profile
        ;;
    6)
        echo "📊 Starting with Debug Inspector..."
        flutter run --hot --enable-software-rendering
        ;;
    *)
        echo "🔄 Auto-selecting fastest option..."
        flutter run --hot --cache-sksl
        ;;
esac

echo
echo "💡 Hot Reload Commands:"
echo "- Press 'r' to hot reload"
echo "- Press 'R' to hot restart"
echo "- Press 'h' for help"
echo "- Press 'q' to quit"