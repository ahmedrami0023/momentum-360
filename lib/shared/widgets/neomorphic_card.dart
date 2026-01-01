import 'package:flutter/material.dart';
import '../../core/theme/neomorphic_style.dart';
import '../../core/constants/app_constants.dart';

/// Neomorphic style card with soft shadows
/// Use for content containers, list items
class NeomorphicCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final NeomorphicElevation elevation;

  const NeomorphicCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.onTap,
    this.elevation = NeomorphicElevation.medium,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = switch (elevation) {
      NeomorphicElevation.subtle => NeomorphicStyle.subtle(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
        ),
      NeomorphicElevation.medium => NeomorphicStyle.medium(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
        ),
      NeomorphicElevation.prominent => NeomorphicStyle.prominent(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
        ),
      NeomorphicElevation.flat => NeomorphicStyle.flat(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
        ),
    };

    final content = Container(
      decoration: decoration,
      padding: padding ?? const EdgeInsets.all(AppConstants.spacingMD),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: content,
      );
    }

    return content;
  }
}

enum NeomorphicElevation {
  subtle,
  medium,
  prominent,
  flat,
}

