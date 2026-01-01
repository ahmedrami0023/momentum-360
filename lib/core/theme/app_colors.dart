import 'package:flutter/material.dart';

/// App color scheme with section-based color coding
/// Workout: Orange/Red gradient
/// Nutrition: Green/Teal
/// Progress: Purple/Blue
class AppColors {
  AppColors._();

  // Workout Colors - Energetic Orange/Red
  static const Color workoutPrimary = Color(0xFFFF6B35);
  static const Color workoutSecondary = Color(0xFFFF8E53);
  static const LinearGradient workoutGradient = LinearGradient(
    colors: [workoutPrimary, workoutSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Nutrition Colors - Fresh Green
  static const Color nutritionPrimary = Color(0xFF4CAF50);
  static const Color nutritionSecondary = Color(0xFF66BB6A);
  static const LinearGradient nutritionGradient = LinearGradient(
    colors: [nutritionPrimary, nutritionSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Progress Colors - Powerful Purple/Blue
  static const Color progressPrimary = Color(0xFF7C4DFF);
  static const Color progressSecondary = Color(0xFF536DFE);
  static const LinearGradient progressGradient = LinearGradient(
    colors: [progressPrimary, progressSecondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Neutral Colors (Light Mode)
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color cardBackgroundLight = Color(0xFFFAFAFA);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color divider = Color(0xFFE0E0E0);

  // Neomorphic Shadow Colors (Light Mode)
  static const Color shadowLight = Colors.white;
  static const Color shadowDark = Color(0xFFBEBEBE);

  // Glass Effect Colors
  static const Color glassBackground = Color(0xB3FFFFFF); // 70% opacity white
  static const Color glassBorder = Color(0x33FFFFFF); // 20% opacity white

  // Semantic Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA726);
  static const Color info = Color(0xFF42A5F5);

  // Dark Mode Colors (for future implementation)
  static const Color backgroundDark = Color(0xFF121212);
  static const Color cardBackgroundDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color glassBackgroundDark = Color(
    0xB3000000,
  ); // 70% opacity black
}
