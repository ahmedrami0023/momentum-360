import 'package:flutter/material.dart';
import '../../core/theme/glass_morphism.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';

/// Bottom navigation bar with glass effect
/// 5 tabs: Home, Nutrition, Workout, Progress, Profile
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  Color _getSectionColor(int index) {
    return switch (index) {
      0 => AppColors.workoutPrimary, // Home
      1 => AppColors.nutritionPrimary, // Nutrition
      2 => AppColors.workoutPrimary, // Workout
      3 => AppColors.progressPrimary, // Progress
      4 => AppColors.textPrimary, // Profile
      _ => AppColors.workoutPrimary,
    };
  }

  @override
  Widget build(BuildContext context) {
    return GlassMorphism.forNavigation(
      child: SafeArea(
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacingMD,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(
                icon: Icons.home_rounded,
                label: 'Home',
                isActive: currentIndex == 0,
                color: _getSectionColor(0),
                onTap: () => onTap(0),
              ),
              _NavBarItem(
                icon: Icons.restaurant_rounded,
                label: 'Nutrition',
                isActive: currentIndex == 1,
                color: _getSectionColor(1),
                onTap: () => onTap(1),
              ),
              _NavBarItem(
                icon: Icons.fitness_center_rounded,
                label: 'Workout',
                isActive: currentIndex == 2,
                color: _getSectionColor(2),
                onTap: () => onTap(2),
              ),
              _NavBarItem(
                icon: Icons.analytics_rounded,
                label: 'Progress',
                isActive: currentIndex == 3,
                color: _getSectionColor(3),
                onTap: () => onTap(3),
              ),
              _NavBarItem(
                icon: Icons.person_rounded,
                label: 'Profile',
                isActive: currentIndex == 4,
                color: _getSectionColor(4),
                onTap: () => onTap(4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final Color color;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppConstants.radiusMD),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingSM,
          vertical: AppConstants.spacingSM,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isActive ? color : AppColors.textSecondary,
            ),
            if (isActive) ...[
              const SizedBox(height: 2),
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

