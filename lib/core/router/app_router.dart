import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/workout/presentation/workout_tab.dart';
import '../../features/nutrition/presentation/nutrition_tab.dart';
import '../../features/progress/presentation/progress_tab.dart';
import '../../features/profile/presentation/profile_tab.dart';
import '../../shared/widgets/bottom_nav_bar.dart';

/// App router configuration with GoRouter
class AppRouter {
  AppRouter._();

  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  static final nutritionNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'nutrition',
  );
  static final workoutNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'workout',
  );
  static final progressNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'progress',
  );
  static final profileNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'profile',
  );

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      // Auth routes
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),

      // Main shell with bottom navigation
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Home branch
          StatefulShellBranch(
            navigatorKey: homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),

          // Nutrition branch
          StatefulShellBranch(
            navigatorKey: nutritionNavigatorKey,
            routes: [
              GoRoute(
                path: '/nutrition',
                name: 'nutrition',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: NutritionTab()),
              ),
            ],
          ),

          // Workout branch
          StatefulShellBranch(
            navigatorKey: workoutNavigatorKey,
            routes: [
              GoRoute(
                path: '/workout',
                name: 'workout',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: WorkoutTab()),
              ),
            ],
          ),

          // Progress branch
          StatefulShellBranch(
            navigatorKey: progressNavigatorKey,
            routes: [
              GoRoute(
                path: '/progress',
                name: 'progress',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProgressTab()),
              ),
            ],
          ),

          // Profile branch
          StatefulShellBranch(
            navigatorKey: profileNavigatorKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfileTab()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Scaffold with bottom navigation bar
class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
