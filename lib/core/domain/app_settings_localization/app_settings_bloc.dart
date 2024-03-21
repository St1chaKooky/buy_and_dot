import 'package:bloc/bloc.dart';
import 'package:buy_and_dot/core/domain/app_settings_localization/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc(super.initialState) {
    on<ChangeLocalEvent>((event, emit) {
      emit(AppSettingsState(
        locale: supportLocaleList.indexOf(event.newLocale),
      ));
    });
  }
  AppLocale get currentLocale => supportLocaleList[state.locale];
  final List<AppLocale> supportLocaleList = [
    AppLocale(name: 'Русский', languageCode: 'ru'),
    AppLocale(name: 'English', languageCode: 'en'),
  ];
}
