import 'package:buy_and_dot/core/domain/container/app_container.dart';
import 'package:buy_and_dot/feature/account/presentation/account_screen.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/page/add_advertisement_scree.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_screen.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_view_model.dart';
import 'package:buy_and_dot/feature/advertisement_details/presentation/page/advertisement_details_screen.dart';
import 'package:buy_and_dot/feature/auth/presentation/auth_screen.dart';
import 'package:buy_and_dot/feature/auth/presentation/auth_view_model.dart';
import 'package:buy_and_dot/feature/favorites/presentation/favorite_view_model.dart';
import 'package:buy_and_dot/feature/favorites/presentation/favorites_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/enter_code/enter_code_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/enter_code/enter_code_view_model.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/new_password/new_password_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/new_password/new_password_view_model.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/password_recovery/password_recovery_screen.dart';
import 'package:buy_and_dot/feature/forgot_password/presentation/password_recovery/password_recovery_view_model.dart';
import 'package:buy_and_dot/feature/nav_bar/presentation/nav_bar_screen.dart';
import 'package:buy_and_dot/feature/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class RouteList {
  static const splash = '/';

  static const _authPath = '/auth';
  static const auth = _authPath;

  static const _advertisementPath = '/advertisement';
  static const advertisement = _advertisementPath;

  static const _favoritePath = '/favorite';
  static const favorite = _favoritePath;

  static const _accountPath = '/account';
  static const account = _accountPath;

  static const _forgotPasswordPath = 'forgot-password';
  static const forgotPassword = '$auth/$_forgotPasswordPath';

  static const _enterPasswordPath = 'enter-password';
  static const enterPassword = '$forgotPassword/$_enterPasswordPath';

  static const _newPasswordPath = 'new-password';
  static const newPassword = '$forgotPassword/$_newPasswordPath';

  static const _addAdvertisementPath = 'add-advertisement';
  static const addAdvertisement = '$advertisement/$_addAdvertisementPath';

  static const _advertisementDetailsPath = 'advertisement-details';
  static String advertisementDetails(String id) =>
      '$favorite/$_advertisementDetailsPath/$id';
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: RouteList.splash,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: RouteList.advertisement,
          routes: <RouteBase>[
            GoRoute(
                path: RouteList.advertisement,
                builder: (context, state) => AdvertisementScreen(
                      viewModel: AdvertisementListViewModel(
                        advertisementRepository: AppContainer()
                            .repositoryScope
                            .advertisementRepository,
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: RouteList._addAdvertisementPath,
                    builder: (context, state) => const AddAdvertisementScreen(),
                  ),
                  GoRoute(
                      path: '${RouteList._advertisementDetailsPath}/:id',
                      builder: (context, state) {
                        final id = state.pathParameters['id'];

                        return AdvertisementDetailsScreen(
                          id: id!,
                        );
                      }),
                ]),
          ],
        ),

        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
                path: RouteList.favorite,
                builder: (context, state) => FavoritesScreen(
                      viewModel: FavoriteListViewModel(
                        advertisementRepository: AppContainer()
                            .repositoryScope
                            .advertisementRepository,
                      ),
                    ),
                routes: [
                  GoRoute(
                    path: RouteList._addAdvertisementPath,
                    builder: (context, state) => const AddAdvertisementScreen(),
                  ),
                  GoRoute(
                      path: '${RouteList._advertisementDetailsPath}/:id',
                      builder: (context, state) {
                        final id = state.pathParameters['id'];

                        return AdvertisementDetailsScreen(
                          id: id!,
                        );
                      }),
                ]),
          ],
        ),

        // The route branch for the third tab of the bottom navigation bar.
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: RouteList.account,
              builder: (context, state) => const AccountScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: RouteList.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
        path: RouteList._authPath,
        builder: (context, state) => AuthScreen(
              viewModel: AuthViewModel(
                authRepository: AppContainer().repositoryScope.authRepository,
              ),
            ),
        routes: [
          GoRoute(
              path: RouteList._forgotPasswordPath,
              builder: (context, state) => PasswordRecoveryScreen(
                    viewModel: PasswordRecoveryViewModel(
                      forgotPasswordRepo:
                          AppContainer().repositoryScope.forgotPasswordRepo,
                    ),
                  ),
              routes: [
                GoRoute(
                  path: RouteList._enterPasswordPath,
                  builder: (context, state) => EnterCodeScreen(
                    viewModel: EnterCodeViewModel(
                      forgotPasswordRepo:
                          AppContainer().repositoryScope.forgotPasswordRepo,
                    ),
                  ),
                ),
                GoRoute(
                  path: RouteList._newPasswordPath,
                  builder: (context, state) => NewPasswordScreen(
                    viewModel: NewPasswordViewModel(
                      forgotPasswordRepo:
                          AppContainer().repositoryScope.forgotPasswordRepo,
                    ),
                  ),
                ),
              ]),
        ]),
  ],
);
