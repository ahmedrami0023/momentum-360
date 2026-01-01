/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Momentum 360';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'All-in-one fitness tracking app with iOS 26 Liquid Glass design';

  // Spacing (8px grid system)
  static const double spacingXS = 4.0;
  static const double spacingSM = 8.0;
  static const double spacingMD = 16.0;
  static const double spacingLG = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border Radius
  static const double radiusSM = 8.0;
  static const double radiusMD = 12.0;
  static const double radiusLG = 16.0;
  static const double radiusXL = 20.0;

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 100);
  static const Duration animationNormal = Duration(milliseconds: 200);
  static const Duration animationSlow = Duration(milliseconds: 300);
  static const Duration animationSlower = Duration(milliseconds: 500);

  // Touch Targets (Apple HIG Guidelines)
  static const double minTouchTarget = 44.0;
  static const double idealTouchTarget = 48.0;

  // Default Values
  static const int defaultRestTimerSeconds = 90;
  static const double defaultWeightKg = 70.0;
  static const double defaultCaloriesGoal = 2000.0;

  // Exercise Categories
  static const List<String> exerciseCategories = [
    'Push',
    'Pull',
    'Legs',
    'Core',
    'Cardio',
    'Other',
  ];

  // Cardio Types
  static const List<String> cardioTypes = [
    'Running',
    'Cycling',
    'Swimming',
    'HIIT',
    'Walking',
    'Other',
  ];

  // Muscle Groups
  static const List<String> muscleGroups = [
    'Chest',
    'Back',
    'Shoulders',
    'Biceps',
    'Triceps',
    'Legs',
    'Core',
    'Glutes',
    'Calves',
  ];

  // Measurement Units
  static const List<String> weightUnits = ['kg', 'lbs'];
  static const List<String> distanceUnits = ['km', 'miles'];

  // Storage Keys (for SharedPreferences)
  static const String keyUser = 'user';
  static const String keyAuthToken = 'auth_token';
  static const String keyWorkouts = 'workouts';
  static const String keyMeals = 'meals';
  static const String keyExercises = 'exercises';
  static const String keyBodyMeasurements = 'body_measurements';
  static const String keyProgressPhotos = 'progress_photos';
  static const String keyPersonalRecords = 'personal_records';
  static const String keyCardioSessions = 'cardio_sessions';
  static const String keyNutritionGoals = 'nutrition_goals';
  static const String keySettings = 'settings';

  // Settings Keys
  static const String keyWeightUnit = 'weight_unit';
  static const String keyDistanceUnit = 'distance_unit';
  static const String keyRestTimerDuration = 'rest_timer_duration';
  static const String keyThemeMode = 'theme_mode';
  static const String keyReduceTransparency = 'reduce_transparency';
}
