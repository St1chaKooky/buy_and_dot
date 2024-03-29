import 'package:buy_and_dot/core/domain/container/app_container.dart';
import 'package:buy_and_dot/feature/auth/presentation/auth_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/enter_code/enter_code_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/new_password/new_password_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/password_recovery/password_recovery_screen.dart';
import 'package:buy_and_dot/feature/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class RouteList {
  static const splash = '/';

  static const _authPath = '/auth';
  static const auth = _authPath;

  static const _forgotPasswordPath = 'forgot-password';
  static const forgotPassword = '$auth/$_forgotPasswordPath';

  static const _enterPasswordPath = 'enter-password';
  static const enterPassword = '$forgotPassword/$_enterPasswordPath';

  static const _newPasswordPath = 'new-password';
  static const newPassword = '$forgotPassword/$_newPasswordPath';
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
        builder: (context, state) => AuthScreen(
              authRepo: AppContainer().repositoryScope.authRepository,
            ),
        routes: [
          GoRoute(
              path: RouteList._forgotPasswordPath,
              builder: (context, state) => PasswordRecoveryScreen(
                    forgotPasswordRepo:
                        AppContainer().repositoryScope.forgotPasswordRepo,
                  ),
              routes: [
                GoRoute(
                  path: RouteList._enterPasswordPath,
                  builder: (context, state) => EnterCodeScreen(
                    forgotPasswordRepo:
                        AppContainer().repositoryScope.forgotPasswordRepo,
                  ),
                ),
                GoRoute(
                  path: RouteList._newPasswordPath,
                  builder: (context, state) => NewPasswordScreen(
                    forgotPasswordRepo:
                        AppContainer().repositoryScope.forgotPasswordRepo,
                  ),
                ),
              ]),
        ]),
  ],
);
