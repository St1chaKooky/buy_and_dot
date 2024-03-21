part of 'app_settings_bloc.dart';

@immutable
sealed class AppSettingsEvent {
  const AppSettingsEvent();
}

class ChangeLocalEvent extends AppSettingsEvent {
  final AppLocale newLocale;
  const ChangeLocalEvent(this.newLocale);
}
