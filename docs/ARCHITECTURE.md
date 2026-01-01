# Momentum 360 - Architecture Guide

## Purpose
This document maps features to their implementation files for quick navigation and context-efficient AI assistance. Use this guide when working on specific features to quickly locate the relevant code.

## Project Overview

Momentum 360 is built using Flutter with a clean architecture approach:
- **Feature-first organization** - Code organized by features (workout, nutrition, etc.)
- **Riverpod state management** - For reactive, scalable state handling  
- **GoRouter navigation** - Type-safe routing with deep linking support
- **Local-first data** - SharedPreferences + JSON (Firebase integration planned)

## Core Architecture

### Data Flow

```
UI (Presentation Layer)
    ↓
Riverpod Providers (State Management)
    ↓
Models (Data Structures)
    ↓
Services (Storage/Business Logic)
    ↓
SharedPreferences (Local Storage)
```

---

## Feature Map

### Authentication
**Location:** `lib/features/auth/`

**Key Files:**
- `presentation/login_screen.dart` - Login UI with email/password
- `presentation/signup_screen.dart` - Registration UI  
- `providers/auth_provider.dart` - Auth state management (TODO)
- `models/user_model.dart` - User data model (TODO)

**Related:**
- `lib/shared/services/storage_service.dart` - User persistence

**Routes:**
- `/login` - Login screen
- `/signup` - Signup screen

---

### Home Dashboard
**Location:** `lib/features/home/`

**Key Files:**
- `presentation/home_screen.dart` - Main dashboard with summary cards
- `presentation/widgets/workout_summary_card.dart` - Today's workout card (TODO)
- `presentation/widgets/nutrition_summary_card.dart` - Nutrition progress (TODO)
- `presentation/widgets/quick_stats_card.dart` - Quick stats display (TODO)
- `providers/home_provider.dart` - Dashboard data aggregation (TODO)

**Features:**
- Quick stats (workouts, streak, PRs)
- Today's workout preview
- Nutrition summary
- Quick action buttons

**Routes:**
- `/home` - Home dashboard (default)

---

### Workout Tracking
**Location:** `lib/features/workout/`

**Key Files:**
- `presentation/workout_tab.dart` - Main workout screen
- `presentation/workout_logger_screen.dart` - Active workout logging (TODO)
- `presentation/workout_program_screen.dart` - Create programs (TODO)
- `presentation/workout_history_screen.dart` - Past workouts (TODO)
- `models/workout_model.dart` - Workout data structure (TODO)
- `models/exercise_model.dart` - Exercise data (TODO)
- `models/workout_set_model.dart` - Set data (reps, weight) (TODO)
- `models/personal_record_model.dart` - PR tracking (TODO)
- `providers/workout_provider.dart` - Workout state management (TODO)

**Features:**
- Log exercises, sets, reps, weight
- Rest timer
- Workout programs
- Workout history
- Personal records tracking

**Routes:**
- `/workout` - Workout tab
- `/workout/log` - Start workout (TODO)
- `/workout/program` - Create program (TODO)
- `/workout/history` - View history (TODO)

**Storage Keys:**
- `keyWorkouts` - List of all workouts
- `keyPersonalRecords` - PR data

---

### Exercise Library
**Location:** `lib/features/exercise_library/`

**Key Files:**
- `presentation/exercise_library_screen.dart` - Browse exercises (TODO)
- `presentation/exercise_detail_screen.dart` - Exercise info (TODO)
- `presentation/create_exercise_screen.dart` - Add custom exercise (TODO)
- `models/exercise_detail_model.dart` - Exercise data (TODO)
- `providers/exercise_library_provider.dart` - Exercise state (TODO)

**Features:**
- 50+ pre-loaded exercises
- Exercise categories (Push, Pull, Legs, Core, Cardio)
- Custom exercise creation
- Exercise instructions

**Routes:**
- `/exercise-library` - Browse exercises (TODO)
- `/exercise-library/:id` - Exercise details (TODO)

**Storage Keys:**
- `keyExercises` - Exercise library

---

### Nutrition Tracking
**Location:** `lib/features/nutrition/`

**Key Files:**
- `presentation/nutrition_tab.dart` - Main nutrition screen
- `presentation/meal_logger_screen.dart` - Log meals (TODO)
- `presentation/nutrition_overview_screen.dart` - Daily summary (TODO)
- `models/meal_model.dart` - Meal data structure (TODO)
- `models/food_item_model.dart` - Individual food (TODO)
- `models/nutrition_goals_model.dart` - Daily targets (TODO)
- `providers/nutrition_provider.dart` - Nutrition state (TODO)

**Features:**
- Manual food entry
- Macro tracking (protein, carbs, fats)
- Daily calorie goals
- Meal history

**Routes:**
- `/nutrition` - Nutrition tab
- `/nutrition/log-meal` - Log meal (TODO)

**Storage Keys:**
- `keyMeals` - List of meals
- `keyNutritionGoals` - Daily targets

---

### Cardio Tracking
**Location:** `lib/features/cardio/`

**Key Files:**
- `presentation/cardio_logger_screen.dart` - Log cardio sessions (TODO)
- `models/cardio_session_model.dart` - Cardio data (type, duration, distance) (TODO)
- `providers/cardio_provider.dart` - Cardio state (TODO)

**Features:**
- Types: Running, Cycling, Swimming, HIIT
- Track duration, distance, pace, calories
- Show in workout history

**Routes:**
- `/cardio/log` - Log session (TODO)

**Storage Keys:**
- `keyCardioSessions` - Cardio history

---

### Progress & Analytics
**Location:** `lib/features/progress/`

**Key Files:**
- `presentation/progress_tab.dart` - Main progress screen
- `presentation/calendar_view_screen.dart` - Calendar of activities (TODO)
- `presentation/analytics_screen.dart` - Charts and graphs (TODO)
- `presentation/body_tracking_screen.dart` - Weight/measurements (TODO)
- `presentation/personal_records_screen.dart` - PR list (TODO)
- `models/body_measurement_model.dart` - Body data (TODO)
- `models/progress_photo_model.dart` - Photo tracking (TODO)
- `providers/progress_provider.dart` - Progress state (TODO)

**Features:**
- Body weight tracking
- Body measurements
- Progress photos
- Calendar view
- Analytics charts (using FL Chart)
- Personal records display

**Routes:**
- `/progress` - Progress tab
- `/progress/calendar` - Calendar view (TODO)
- `/progress/analytics` - Analytics (TODO)
- `/progress/body-tracking` - Body metrics (TODO)
- `/progress/personal-records` - PRs (TODO)

**Storage Keys:**
- `keyBodyMeasurements` - Body data
- `keyProgressPhotos` - Photos

---

### Profile & Settings
**Location:** `lib/features/profile/`

**Key Files:**
- `presentation/profile_tab.dart` - Profile overview
- `presentation/settings_screen.dart` - App settings (TODO)
- `presentation/edit_profile_screen.dart` - Edit user info (TODO)
- `models/user_profile_model.dart` - Profile data (TODO)
- `providers/profile_provider.dart` - Profile state (TODO)

**Features:**
- User profile
- Settings (units, rest timer, theme)
- Nutrition goals
- Account management

**Routes:**
- `/profile` - Profile tab
- `/settings` - Settings (TODO)

**Storage Keys:**
- `keySettings` - App settings
- `keyUser` - User profile

---

## Core Systems

### Theme & Design System
**Location:** `lib/core/theme/`

**Files:**
- `app_theme.dart` - Material 3 theme configuration
- `app_colors.dart` - Color palette (section colors)
- `neomorphic_style.dart` - Neomorphic helpers
- `glass_morphism.dart` - Liquid Glass effects

**See also:** `docs/DESIGN_GUIDELINES.md`

---

### Navigation
**Location:** `lib/core/router/`

**Files:**
- `app_router.dart` - GoRouter configuration with StatefulShellRoute

**Related:** `lib/shared/widgets/bottom_nav_bar.dart`

**Navigation Structure:**
- Bottom tabs: Home, Nutrition, Workout, Progress, Profile
- Each tab has its own navigation stack
- Auth routes are separate (no bottom nav)

---

### Data Storage
**Location:** `lib/shared/services/`

**Files:**
- `storage_service.dart` - Local persistence (SharedPreferences + JSON)
- `mock_data_service.dart` - Sample data for testing

**Key Methods:**
- `saveWorkouts()` / `getWorkouts()` - Workout CRUD
- `saveMeals()` / `getMeals()` - Meal CRUD
- `saveBodyMeasurements()` - Body tracking
- `updatePersonalRecord()` - PR updates

**Note:** All models serialize to JSON for local storage. Easy migration path to Firebase.

---

### Shared Components
**Location:** `lib/shared/widgets/`

**Files:**
- `glass_card.dart` - Translucent cards with blur
- `neomorphic_card.dart` - Soft shadow cards
- `custom_button.dart` - Buttons with section colors
- `custom_text_field.dart` - Input fields
- `loading_indicator.dart` - Loading states
- `bottom_nav_bar.dart` - Main navigation

**Usage:**
```dart
// Glass card
GlassCard(
  child: Text('Content'),
  intensity: GlassIntensity.medium,
)

// Neomorphic card
NeomorphicCard(
  child: Text('Content'),
  elevation: NeomorphicElevation.medium,
)

// Custom button
CustomButton(
  text: 'Start Workout',
  section: ButtonSection.workout,
  onPressed: () {},
)
```

---

## Common Development Tasks

### Adding a New Feature

1. Create feature folder in `lib/features/new_feature/`
2. Add subfolders: `presentation/`, `models/`, `providers/`
3. Create screen files in `presentation/`
4. Create data models in `models/`
5. Create Riverpod providers in `providers/`
6. Update `app_router.dart` with new routes
7. Update this document

### Modifying the Design System

1. Edit files in `lib/core/theme/`
2. Update `docs/DESIGN_GUIDELINES.md`
3. Rebuild shared widgets if needed
4. Test across all features

### Adding a New Model

1. Create model file in appropriate `features/*/models/`
2. Add `toJson()` and `fromJson()` methods
3. Add CRUD methods to `storage_service.dart`
4. Update this document

### Changing Navigation

1. Edit `lib/core/router/app_router.dart`
2. Update `bottom_nav_bar.dart` if adding/removing tabs
3. Test deep linking and back button behavior

---

## State Management with Riverpod

### Provider Types

- **Provider** - Read-only data that never changes
- **StateProvider** - Simple mutable state
- **StateNotifierProvider** - Complex mutable state (recommended)
- **FutureProvider** - Async data loading
- **StreamProvider** - Real-time data streams

### Example Pattern

```dart
// Model
class Workout {
  final String id;
  final String name;
  // ... more fields
  
  Map<String, dynamic> toJson() => {...};
  factory Workout.fromJson(Map<String, dynamic> json) => ...;
}

// State Notifier
class WorkoutNotifier extends StateNotifier<List<Workout>> {
  WorkoutNotifier() : super([]);
  
  Future<void> loadWorkouts() async {
    final data = StorageService.instance.getWorkouts();
    state = data.map((json) => Workout.fromJson(json)).toList();
  }
  
  Future<void> addWorkout(Workout workout) async {
    await StorageService.instance.addWorkout(workout.toJson());
    state = [...state, workout];
  }
}

// Provider
final workoutProvider = StateNotifierProvider<WorkoutNotifier, List<Workout>>(
  (ref) => WorkoutNotifier(),
);

// Usage in UI
final workouts = ref.watch(workoutProvider);
ref.read(workoutProvider.notifier).addWorkout(newWorkout);
```

---

## Migration to Firebase (Future)

When ready for backend integration:

1. Add Firebase dependencies to `pubspec.yaml`
2. Run `flutterfire configure`
3. Replace `StorageService` methods with Firebase calls
4. Models already use JSON - direct mapping to Firestore
5. Update providers to use Firebase instead of local storage
6. Keep `StorageService` for offline caching

---

## Testing Strategy

### Unit Tests
- Test models (toJson/fromJson)
- Test business logic in providers
- Test utility functions

### Widget Tests
- Test individual screens
- Test shared components
- Test navigation flows

### Integration Tests
- Test complete user flows
- Test data persistence
- Test state management

---

## Performance Considerations

1. **Images** - Use cached_network_image for progress photos
2. **Lists** - Use ListView.builder for large datasets
3. **Charts** - Limit data points in FL Chart
4. **State** - Keep providers focused and granular
5. **Navigation** - Use StatefulShellRoute for tab persistence

---

## Questions?

- **Design questions:** See `docs/DESIGN_GUIDELINES.md`
- **Feature location:** Use the Feature Map above
- **New features:** Follow the patterns established here
- **Firebase migration:** See Migration section above

---

**Last Updated:** January 1, 2026  
**App Version:** 1.0.0

