import 'package:buy_and_dot/feature/settings/domain/service/app_settings_bloc.dart';
import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/domain/router/router.dart';
import 'package:buy_and_dot/theme/themes/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp(
    appSettingsBloc: AppSettingsBloc(const AppSettingsState(locale: 0)),
  ));
}

class MyApp extends StatelessWidget {
  final AppSettingsBloc appSettingsBloc;
  const MyApp({super.key, required this.appSettingsBloc});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appSettingsBloc,
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        bloc: appSettingsBloc,
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: appSettingsBloc.currentLocale,
            supportedLocales: appSettingsBloc.supportLocaleList,
            debugShowCheckedModeBanner: false,
            title: 'Buy And Dot',
            theme: themeData,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
