import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/neomorphic_style.dart';
import '../../core/constants/app_constants.dart';

/// Custom button with section colors and neomorphic style
class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSection? section;
  final bool isLoading;
  final Widget? icon;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.section,
    this.isLoading = false,
    this.icon,
    this.width,
    this.height = 48,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  Color _getButtonColor() {
    if (widget.section != null) {
      return switch (widget.section!) {
        ButtonSection.workout => AppColors.workoutPrimary,
        ButtonSection.nutrition => AppColors.nutritionPrimary,
        ButtonSection.progress => AppColors.progressPrimary,
      };
    }
    return AppColors.workoutPrimary;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = _getButtonColor();
    final isDisabled = widget.onPressed == null || widget.isLoading;

    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) ...[
          widget.icon!,
          const SizedBox(width: AppConstants.spacingSM),
        ],
        if (widget.isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.type == ButtonType.primary ? Colors.white : buttonColor,
              ),
            ),
          )
        else
          Text(
            widget.text,
            style: theme.textTheme.labelLarge?.copyWith(
              color: widget.type == ButtonType.primary
                  ? Colors.white
                  : buttonColor,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );

    BoxDecoration? decoration;
    Color? backgroundColor;

    switch (widget.type) {
      case ButtonType.primary:
        backgroundColor = buttonColor;
        decoration = BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    color: buttonColor.withOpacity(0.3),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
        );
        break;

      case ButtonType.secondary:
        decoration = NeomorphicStyle.medium(
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        ).copyWith(border: Border.all(color: buttonColor, width: 2));
        break;

      case ButtonType.text:
        backgroundColor = Colors.transparent;
        decoration = BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppConstants.radiusMD),
        );
        break;
    }

    return GestureDetector(
      onTapDown: isDisabled ? null : (_) => setState(() => _isPressed = true),
      onTapUp: isDisabled ? null : (_) => setState(() => _isPressed = false),
      onTapCancel: isDisabled ? null : () => setState(() => _isPressed = false),
      onTap: isDisabled ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: AppConstants.animationFast,
        width: widget.width,
        height: widget.height,
        decoration: decoration,
        child: Center(child: buttonChild),
      ),
    );
  }
}

enum ButtonType { primary, secondary, text }

enum ButtonSection { workout, nutrition, progress }
