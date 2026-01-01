import 'package:flutter/material.dart';
import '../../core/theme/glass_morphism.dart';
import '../../core/constants/app_constants.dart';

/// Translucent glass card with blur effect
/// Use for floating summaries, modals, and special content
class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final GlassIntensity intensity;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    this.intensity = GlassIntensity.medium,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: padding ?? const EdgeInsets.all(AppConstants.spacingMD),
      child: child,
    );

    final glassWidget = switch (intensity) {
      GlassIntensity.subtle => GlassMorphism.subtle(
        child: content,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
      ),
      GlassIntensity.medium => GlassMorphism.medium(
        child: content,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
      ),
      GlassIntensity.heavy => GlassMorphism.heavy(
        child: content,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
      ),
    };

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: glassWidget,
      );
    }

    return glassWidget;
  }
}

enum GlassIntensity { subtle, medium, heavy }
