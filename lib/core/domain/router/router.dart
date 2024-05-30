import 'package:buy_and_dot/core/domain/container/app_container.dart';
import 'package:buy_and_dot/feature/account/presentation/page/account_screen.dart';
import 'package:buy_and_dot/feature/account/presentation/page/edit_account_screen.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/page/add_advertisement_scree.dart';
import 'package:buy_and_dot/feature/add_advertisement/presentation/page/view_model_add_advertisement.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/advertisement_screen.dart';
import 'package:buy_and_dot/feature/advertisement/presentation/page/all_advertisement/advertisement_list_view_model.dart';
import 'package:buy_and_dot/feature/advertisement_details/presentation/page/advertisement_details_screen.dart';
import 'package:buy_and_dot/feature/aunknow_account/presentation/page/unknow_account_screen.dart';
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

    static const _editAccountPath = 'editAccount';
  static const editAccount = '$account/$_editAccountPath';

  static const _addFavoriteAdvertisementPath = 'addFavorite-advertisement';
  static const addFavoriteAdvertisement =
      '$favorite/$_addFavoriteAdvertisementPath';

  static const _advertisementDetailsPath = 'advertisement-details';
  static String advertisementDetails(String id) =>
      '$advertisement/$_advertisementDetailsPath/$id';
  static const _accountAdvertisementDetailsPath = 'account-advertisement-details';
  static String accountAdvertisementDetails() =>
      '$advertisement/$_advertisementDetailsPath/$_accountAdvertisementDetailsPath';

  static const _advertisementFavoriteDetailsPath = 'advertisement-details';
  static String advertisementFavoriteDetails(String id) =>
      '$favorite/$_advertisementFavoriteDetailsPath/$id';
}

// GoRouter configuration
final router = GoRouter(
  initialLocation: RouteList.splash,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
            bool hasMultipleSlashes(String string) {
  final parts = string.split('/'); 
  return parts.length <= 2; 
}

        return ScaffoldWithNavBar(
          navigationShell: navigationShell,
          showBottomBar: !hasMultipleSlashes(state.fullPath!),
        );
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
                    // ignore: prefer_const_constructors
                    builder: (context, state) => AddAdvertisementScreen(
                      viewModel: ViewModelAddAdvertisement(
                          imagePickerRepository: AppContainer()
                              .repositoryScope
                              .imagePickerRepository),
                    ),
                  ),
                  GoRoute(
                    routes: [
                      GoRoute(path: RouteList._accountAdvertisementDetailsPath, builder: (context, state) => UnknowAccountScreen(),)
                    ],
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
                    path: RouteList._addFavoriteAdvertisementPath,
                    builder: (context, state) => AddAdvertisementScreen(
                      viewModel: ViewModelAddAdvertisement(
                          imagePickerRepository: AppContainer()
                              .repositoryScope
                              .imagePickerRepository),
                    ),
                  ),
                  GoRoute(
                      path:
                          '${RouteList._advertisementFavoriteDetailsPath}/:id',
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
              routes: [
                GoRoute(path: RouteList._editAccountPath,builder: (context, state) => const EditAccountScreen(),)
              ],
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
