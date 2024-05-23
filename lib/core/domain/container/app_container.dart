import 'dart:developer';

import 'package:buy_and_dot/feature/add_advertisement/data/image_picker_repository/image_picker_mocked_reposiory.dart';
import 'package:buy_and_dot/feature/add_advertisement/domain/repository/image_picker_repository.dart';
import 'package:buy_and_dot/feature/advertisement/data/repository/advertisement_mocked_repository.dart';
import 'package:buy_and_dot/feature/advertisement/domain/repository/advertisement_repository.dart';
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
      final ImagePickerRepository imagePickerRepository = ImagePickerMockedReposiory();
      final forgotPasswordRepo =
          ForgotPasswordMockedRepo(ForgetPasswordMockedDataSource());
      final authRepo = AuthMockedRepo(AuthMockedDataSource());
      final AdvertisementRepository advertisementRepository =
          AdvertisementMockedRepository();

      repositoryScope = RepositoryScope(
        imagePickerRepository: imagePickerRepository,
          advertisementRepository: advertisementRepository,
          authRepository: authRepo,
          forgotPasswordRepo: forgotPasswordRepo);

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
  final ImagePickerRepository imagePickerRepository;
  final AdvertisementRepository advertisementRepository;
  final AuthMockedRepo authRepository;
  final ForgotPasswordRepo forgotPasswordRepo;
  RepositoryScope({
    required this.advertisementRepository,
    required this.imagePickerRepository,

    required this.forgotPasswordRepo,
    required this.authRepository,
  });
}
