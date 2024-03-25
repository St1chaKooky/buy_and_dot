import 'dart:developer';

import 'package:buy_and_dot/feature/auth/data/source/auth_mocked_data.dart';
import 'package:buy_and_dot/feature/auth/domain/repo/auth_mocked_repo.dart';
import 'package:buy_and_dot/feature/forgot_password/data/source/forgot_password_mocked_data.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/repo/forgot_password_mocked_repo.dart';
import 'package:buy_and_dot/feature/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:buy_and_dot/feature/settings/domain/service/app_settings_bloc.dart';
import 'package:get_it/get_it.dart';

class AppContainer {
  late final ServiceScope serviceScope;
  late final RepositoryScope repositoryScope;

  AppContainer.init() {
    ready = initDependencies();
    GetIt.instance.registerSingleton(this);
  }

  factory AppContainer() => GetIt.instance<AppContainer>();

  late final Future<bool> ready;

  Future<bool> initDependencies() async {
    try {
      final forgotPasswordRepo =
          ForgotPasswordMockedRepo(ForgetPasswordMockedDataSource());
      final authRepo = AuthMockedRepo(AuthMockedDataSource());

      repositoryScope = RepositoryScope(
          authRepository: authRepo, forgotPasswordRepo: forgotPasswordRepo);

      final settingsService =
          AppSettingsBloc(const AppSettingsState(locale: 0));

      serviceScope = ServiceScope(settingsService: settingsService);
      return true;
    } catch (e, st) {
      log('App Container has not been initialized', error: e, stackTrace: st);
      return false;
    }
  }
}

class ServiceScope {
  final AppSettingsBloc settingsService;

  ServiceScope({
    required this.settingsService,
  });
}

class RepositoryScope {
  final AuthMockedRepo authRepository;
  final ForgotPasswordRepo forgotPasswordRepo;
  RepositoryScope({
    required this.forgotPasswordRepo,
    required this.authRepository,
  });
}
