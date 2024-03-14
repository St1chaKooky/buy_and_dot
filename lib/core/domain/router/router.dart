import 'package:buy_and_dot/feature/auth/presentation/auth_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/forgot_password_screen.dart';
import 'package:buy_and_dot/feature/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

// Тут можно сделать константы для роутов.
// Что-то вроде вот этого
abstract class RouteList {
  static const splash = '/';

  static const _authPath = '/auth';
  static const auth = _authPath;

  static const _forgotPasswordPath = 'forgot-password';
  static const forgotPassword = '$auth/$_forgotPasswordPath';
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: RouteList.splash,
  routes: [
    GoRoute(
      path: RouteList.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: RouteList._authPath,
        builder: (context, state) => const AuthScreen(),
        routes: [
          GoRoute(
              path: RouteList._forgotPasswordPath,
              builder: (context, state) => const ForgotPasswordScreen()),
        ]),
  ],
);
