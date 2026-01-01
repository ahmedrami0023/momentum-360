import 'dart:ui';
import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Liquid Glass effect helpers inspired by iOS 26
/// Strategic use for navigation bars, modals, and floating elements
class GlassMorphism {
  GlassMorphism._();

  /// Subtle glass effect (light blur)
  static Widget subtle({
    required Widget child,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.glassBackground,
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            border: Border.all(
              color: borderColor ?? AppColors.glassBorder,
              width: 1,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// Medium glass effect (standard blur)
  static Widget medium({
    required Widget child,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.glassBackground,
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            border: Border.all(
              color: borderColor ?? AppColors.glassBorder,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// Heavy glass effect (strong blur)
  static Widget heavy({
    required Widget child,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Color? borderColor,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.glassBackground,
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            border: Border.all(
              color: borderColor ?? AppColors.glassBorder,
              width: 2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// For navigation bars (bottom tab bar, app bar)
  static Widget forNavigation({
    required Widget child,
    BorderRadius? borderRadius,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: borderRadius ?? BorderRadius.zero,
            border: Border(
              top: BorderSide(
                color: AppColors.glassBorder,
                width: 1,
              ),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// For modal overlays and dialogs
  static Widget forModal({
    required Widget child,
    BorderRadius? borderRadius,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: borderRadius ?? BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.glassBorder,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// For floating action buttons
  static Widget forFAB({
    required Widget child,
    BorderRadius? borderRadius,
  }) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.glassBackground,
            borderRadius: borderRadius ?? BorderRadius.circular(28),
            border: Border.all(
              color: AppColors.glassBorder,
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

