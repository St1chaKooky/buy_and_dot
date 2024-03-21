import 'package:buy_and_dot/core/domain/app_settings_localization/app_locale.dart';
import 'package:buy_and_dot/core/domain/app_settings_localization/app_settings_bloc.dart';
import 'package:buy_and_dot/core/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:buy_and_dot/core/presentation/widget/button/text_button.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_in_page.dart';
import 'package:buy_and_dot/feature/auth/presentation/sign_up_page.dart';
import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/domain/intl/generated/l10n.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final _appSettingsBloc = context.read<AppSettingsBloc>();
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  TextTheme get theme => Theme.of(context).textTheme;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          onTapAction: () {
            showModalBottomSheet(
                backgroundColor: ColorCollection.surfaceContainerLow,
                showDragHandle: true,
                enableDrag: false,
                context: context,
                builder: (context) => _bottomSheet);
          },
          bottom: TabBar(
            unselectedLabelColor: ColorCollection.onSurfaceVar,
            labelColor: ColorCollection.primary,
            labelStyle: theme.titleSmall,
            unselectedLabelStyle: theme.titleSmall,
            tabs: [
              Tab(
                text: S.of(context).logIn,
              ),
              Tab(
                text: S.of(context).signUp,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SignInPage(),
            SignUpPage(),
          ],
        ),
      ),
    );
  }

  Widget get _bottomSheet => Container(
      width: screenWidth,
      height: screenHeight / 4.45,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).settings,
                  style: theme.titleLarge!
                      .copyWith(color: ColorCollection.onSurfaceVar),
                ),
                SizedBox(
                  child: MyTextButton(
                    maxWidth: false,
                    verticalPadding: 0,
                    onTap: () {
                      context.pop();
                    },
                    text: S.of(context).ready,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            DropdownMenu<AppLocale>(
                width: screenWidth - 32,
                inputDecorationTheme: InputDecorationTheme(
                  floatingLabelStyle:
                      theme.bodyLarge!.copyWith(color: ColorCollection.primary),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                        color: ColorCollection.primary,
                        width:
                            3), // Убираем границу, оставляя только закругления
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(
                        color: ColorCollection.outline,
                        width:
                            1), // Убираем границу, оставляя только закругления
                  ),
                ),
                label: Text(
                  _appSettingsBloc.currentLocale.name,
                  style: theme.bodyLarge,
                ),
                onSelected: (value) {
                  if (value != null) {
                    _appSettingsBloc.add(ChangeLocalEvent(value));
                  }
                },
                dropdownMenuEntries: _appSettingsBloc.supportLocaleList
                    .map((e) => DropdownMenuEntry<AppLocale>(
                          value: e,
                          label: e.name,
                        ))
                    .toList()),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ));
}
