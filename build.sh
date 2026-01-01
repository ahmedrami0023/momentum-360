#!/bin/bash
set -e

# Install Flutter
echo "Installing Flutter..."
FLUTTER_VERSION="3.24.0"
FLUTTER_SDK_PATH="$HOME/flutter"

if [ ! -d "$FLUTTER_SDK_PATH" ]; then
  git clone --branch stable https://github.com/flutter/flutter.git "$FLUTTER_SDK_PATH"
  cd "$FLUTTER_SDK_PATH"
  git checkout $FLUTTER_VERSION
  export PATH="$FLUTTER_SDK_PATH/bin:$PATH"
else
  export PATH="$FLUTTER_SDK_PATH/bin:$PATH"
fi

# Verify Flutter installation
flutter --version

# Navigate to project directory
cd "$VERCEL_PROJECT_ROOT" || cd "$(dirname "$0")/.."

# Get dependencies
echo "Getting Flutter dependencies..."
flutter pub get

# Build web app
echo "Building Flutter web app..."
flutter build web --release

echo "Build completed successfully!"

