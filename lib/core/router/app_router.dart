import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) =>
          buildFadeTransition(state, const SplashScreen()),
    ),

    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          buildFadeTransition(state, const LoginScreen()),
    ),

    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
          buildSlideTransition(state, const HomeScreen()),
    ),

    GoRoute(
      path: '/tasks',
      pageBuilder: (context, state) =>
          buildSlideTransition(state, const TasksScreen()),
    ),

    GoRoute(
      path: '/expenses',
      pageBuilder: (context, state) =>
          buildSlideTransition(state, const ExpensesScreen()),
    ),

    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) =>
          buildFadeTransition(state, const ProfileScreen()),
    ),
  ],
);
