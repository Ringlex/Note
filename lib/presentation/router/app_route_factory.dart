import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note/presentation/screens/dashboard/dashboard_route.dart';
import 'package:note/presentation/screens/home/home_route.dart';
import 'package:note/presentation/screens/home/home_screen.dart';
import 'package:note/presentation/screens/profile/profile_route.dart';
import 'package:note/presentation/screens/profile/profile_screen.dart';
import 'package:note/presentation/screens/splash/splash_route.dart';
import 'package:note/presentation/screens/splash/splash_screen.dart';

class AppRouteFactory {
  GoRouter router({
    required GlobalKey<NavigatorState> rootNavigatorKey,
    required GlobalKey<NavigatorState> shellNavigatorKey,
  }) =>
      GoRouter(
        navigatorKey: rootNavigatorKey,
        initialLocation: SplashScreen.routeName,
        errorBuilder: (context, state) {
          return splashRoute(state);
        },
        routes: [
          GoRoute(
            path: SplashScreen.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (_, state) => splashRoute(state),
          ),
          ShellRoute(
            navigatorKey: shellNavigatorKey,
            builder: (_, state, child) => dashboardRoute(state, child),
            routes: [
              GoRoute(
                path: HomeScreen.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: homeRoute(state),
                ),
              ),
              GoRoute(
                path: ProfileScreen.routeName,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: profileRoute(state),
                ),
              ),
            ],
          ),
        ],
      );
}
