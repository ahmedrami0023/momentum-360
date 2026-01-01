# Momentum 360 - Solo Fitness App

[![Flutter CI](https://github.com/ahmedrami0023/momentum-360/actions/workflows/flutter_ci.yml/badge.svg)](https://github.com/ahmedrami0023/momentum-360/actions/workflows/flutter_ci.yml)
[![License](https://img.shields.io/badge/License-Private-red.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.38.5-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.10.4-0175C2?logo=dart)](https://dart.dev)

Modern all-in-one fitness tracking app with iOS 26 Liquid Glass design. Track workouts, nutrition, progress, and achieve your fitness goals.

## ✨ Features

### Current (MVP - V1.0)
- ✅ **Workout Tracking** - Log exercises, sets, reps, and weight
- ✅ **Workout Programming** - Create custom workout plans
- ✅ **Exercise Library** - Comprehensive exercise database with custom exercise support
- ✅ **Personal Records** - Track your best lifts automatically
- ✅ **Nutrition Tracking** - Log meals and track macros
- ✅ **Cardio Tracking** - Log running, cycling, and other cardio activities
- ✅ **Progress Analytics** - View charts and track your journey
- ✅ **Body Measurements** - Track weight and body measurements over time
- ✅ **Progress Photos** - Compare your transformation
- ✅ **Calendar View** - See all your workouts and meals in one place
- ✅ **Workout History** - Review past workouts
- ✅ **User Authentication** - Secure login and signup

### Coming Soon (P1 Features)
- 🔄 Habit Tracking - Build healthy habits
- 🔄 AI Workout Generation - Get personalized workout suggestions
- 🔄 AI Nutrition Planning - Smart meal planning
- 🔄 Pre-built Templates - Beginner-friendly workout programs
- 🔄 Dark Mode - Eye-friendly dark theme
- 🔄 Data Export - Backup your data
- 🔄 Offline Mode - Train without internet
- 🔄 Enhanced Features - Supersets, progressive overload, and more

### Future
- 🚀 Coach/Client Platform - Separate app for trainers and their clients
- 🚀 Firebase Backend - Cloud sync across devices
- 🚀 Social Features - Share progress and achievements

## 🎨 Design

Momentum 360 features a cutting-edge design inspired by iOS 26's **Liquid Glass** aesthetic combined with **Neomorphism**:

- **Liquid Glass Effects** - Translucent navigation bars and modals with beautiful blur effects
- **Neomorphic Cards** - Soft, tactile UI elements with subtle shadows
- **Section-Based Colors** 
  - 🔥 Workout: Energetic Orange (#FF6B35)
  - 🥗 Nutrition: Fresh Green (#4CAF50)
  - 📊 Progress: Powerful Purple (#7C4DFF)
- **Material 3** - Modern, accessible design system
- **Google Fonts** - Beautiful Inter typography

## 🛠 Tech Stack

- **Framework:** Flutter 3.x (Android, iOS, Web)
- **State Management:** Riverpod
- **Navigation:** GoRouter
- **Charts:** FL Chart
- **Storage:** SharedPreferences (Firebase coming in V2)
- **Fonts:** Google Fonts (Inter)

## 📦 Installation & Setup

### Prerequisites
- Flutter SDK 3.x or higher
- Dart 3.x or higher
- Android Studio / Xcode (for mobile development)
- Git

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/momentum-360.git
   cd momentum-360
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Web
   flutter run -d chrome
   
   # Android
   flutter run -d android
   
   # iOS (macOS only)
   flutter run -d ios
   ```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── app.dart                     # Main app widget
├── core/                        # Core functionality
│   ├── theme/                   # Design system
│   │   ├── app_colors.dart      # Color palette
│   │   ├── app_theme.dart       # Material theme
│   │   ├── neomorphic_style.dart # Neomorphic helpers
│   │   └── glass_morphism.dart  # Liquid Glass effects
│   ├── router/                  # Navigation
│   │   └── app_router.dart      # GoRouter configuration
│   ├── constants/               # App constants
│   └── utils/                   # Utilities (validators, date utils)
├── features/                    # Feature modules
│   ├── auth/                    # Authentication
│   ├── home/                    # Home dashboard
│   ├── workout/                 # Workout tracking
│   ├── nutrition/               # Nutrition tracking
│   ├── progress/                # Progress & analytics
│   ├── exercise_library/        # Exercise database
│   ├── cardio/                  # Cardio tracking
│   └── profile/                 # User profile & settings
└── shared/                      # Shared resources
    ├── widgets/                 # Reusable UI components
    └── services/                # Business logic & data
```

For detailed architecture, see [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md)

## 🎨 Design Guidelines

See [`docs/DESIGN_GUIDELINES.md`](docs/DESIGN_GUIDELINES.md) for:
- Design principles
- Component specifications
- Color usage rules
- Typography hierarchy
- Spacing system
- Animation guidelines
- Accessibility standards

## 🚀 Development

### Running Tests
```bash
flutter test
```

### Code Generation (Riverpod)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Analyze Code
```bash
flutter analyze
```

### Format Code
```bash
flutter format lib
```

## 🔄 CI/CD

This project uses **GitHub Actions** for continuous integration:

### Automated Checks (On every push/PR)
- ✅ Code formatting verification
- ✅ Static code analysis (`flutter analyze`)
- ✅ Unit tests
- ✅ Web build
- ✅ Android APK build

### Dependabot
- 🤖 Automatic dependency updates
- 📦 Weekly checks for new package versions
- 🔐 Security vulnerability alerts

### Workflow Status
Check the latest build status: [GitHub Actions](https://github.com/ahmedrami0023/momentum-360/actions)

## 🗺 Roadmap

### Version 1.0 (Current)
- ✅ Core fitness tracking features
- ✅ Beautiful iOS 26-inspired UI
- ✅ Local data storage

### Version 1.5 (Next)
- 🔄 AI-powered features
- 🔄 Habit tracking
- 🔄 Dark mode
- 🔄 Enhanced charts and analytics

### Version 2.0 (Future)
- 🚀 Firebase backend integration
- 🚀 Cloud sync
- 🚀 Multi-device support
- 🚀 Social features

### Version 3.0 (Future)
- 🚀 Coach/Client platform
- 🚀 Payment processing
- 🚀 Messaging system
- 🚀 Business management tools

## 📄 License

This project is private and proprietary.

## 👨‍💻 Developer

Built with ❤️ using Flutter

## 🤝 Contributing

This is a private project. For questions or suggestions, please contact the repository owner.

---

**Note:** This app is currently in active development. Features and design may change as development progresses.
