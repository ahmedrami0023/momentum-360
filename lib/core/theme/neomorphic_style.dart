import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Neomorphic design style helpers
/// Provides reusable BoxDecoration configurations for soft shadow effects
class NeomorphicStyle {
  NeomorphicStyle._();

  /// Subtle neomorphic elevation (2-4dp)
  static BoxDecoration subtle({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardBackgroundLight,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        // Light shadow (top-left)
        BoxShadow(
          color: AppColors.shadowLight.withOpacity(0.7),
          offset: const Offset(-2, -2),
          blurRadius: 4,
          spreadRadius: 0,
        ),
        // Dark shadow (bottom-right)
        BoxShadow(
          color: AppColors.shadowDark.withOpacity(0.2),
          offset: const Offset(2, 2),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Medium neomorphic elevation (4-8dp)
  static BoxDecoration medium({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardBackgroundLight,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        // Light shadow (top-left)
        BoxShadow(
          color: AppColors.shadowLight.withOpacity(0.7),
          offset: const Offset(-4, -4),
          blurRadius: 8,
          spreadRadius: 0,
        ),
        // Dark shadow (bottom-right)
        BoxShadow(
          color: AppColors.shadowDark.withOpacity(0.3),
          offset: const Offset(4, 4),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Prominent neomorphic elevation (8-12dp)
  static BoxDecoration prominent({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardBackgroundLight,
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      boxShadow: [
        // Light shadow (top-left)
        BoxShadow(
          color: AppColors.shadowLight.withOpacity(0.8),
          offset: const Offset(-6, -6),
          blurRadius: 12,
          spreadRadius: 0,
        ),
        // Dark shadow (bottom-right)
        BoxShadow(
          color: AppColors.shadowDark.withOpacity(0.35),
          offset: const Offset(6, 6),
          blurRadius: 12,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Inset neomorphic style (for inputs and pressed states)
  static BoxDecoration inset({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardBackgroundLight,
      borderRadius: borderRadius ?? BorderRadius.circular(10),
      boxShadow: [
        // Inner shadow effect (inverted)
        BoxShadow(
          color: AppColors.shadowDark.withOpacity(0.25),
          offset: const Offset(2, 2),
          blurRadius: 4,
          spreadRadius: -2,
        ),
        BoxShadow(
          color: AppColors.shadowLight.withOpacity(0.5),
          offset: const Offset(-2, -2),
          blurRadius: 4,
          spreadRadius: -2,
        ),
      ],
    );
  }

  /// Flat neomorphic style (minimal shadows)
  static BoxDecoration flat({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardBackgroundLight,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowDark.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 4,
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Pressed state (for buttons)
  static BoxDecoration pressed({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? AppColors.cardBackgroundLight,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowDark.withOpacity(0.15),
          offset: const Offset(1, 1),
          blurRadius: 2,
          spreadRadius: -1,
        ),
      ],
    );
  }
}

