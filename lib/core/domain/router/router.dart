import 'package:buy_and_dot/feature/auth/presentation/auth_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/forgot_password_screen.dart';
import 'package:buy_and_dot/feature/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
        routes: [
          GoRoute(
              path: 'forgotPassword',
              builder: (context, state) => const ForgotPasswordScreen()),
        ]),
  ],
);
