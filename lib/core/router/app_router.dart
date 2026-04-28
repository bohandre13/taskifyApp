import 'package:go_router/go_router.dart';
import 'package:taskify/core/router/transitions.dart';
import 'package:taskify/features/splash/splash_screen.dart';

// Iremos agregando imports conforme creemos pantallas:
// import '../../features/auth/login_screen.dart';
// import '../../features/home/home_screen.dart';
// import '../../features/tasks/tasks_screen.dart';
// import '../../features/expenses/expenses_screen.dart';
// import '../../features/profile/profile_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      pageBuilder: (context, state) =>
          buildFadeTransition(state, const SplashScreen()),
    ),

    // Descomenta cada uno cuando crees la pantalla:
    // GoRoute(
    //   path: '/login',
    //   pageBuilder: (context, state) =>
    //       buildFadeTransition(state, const LoginScreen()),
    // ),
    // GoRoute(
    //   path: '/home',
    //   pageBuilder: (context, state) =>
    //       buildSlideTransition(state, const HomeScreen()),
    // ),
    // GoRoute(
    //   path: '/tasks',
    //   pageBuilder: (context, state) =>
    //       buildSlideTransition(state, const TasksScreen()),
    // ),
    // GoRoute(
    //   path: '/expenses',
    //   pageBuilder: (context, state) =>
    //       buildSlideTransition(state, const ExpensesScreen()),
    // ),
    // GoRoute(
    //   path: '/profile',
    //   pageBuilder: (context, state) =>
    //       buildFadeTransition(state, const ProfileScreen()),
    // ),
  ],
);
