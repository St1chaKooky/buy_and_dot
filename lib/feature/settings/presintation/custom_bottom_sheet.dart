import 'package:buy_and_dot/core/domain/intl/generated/l10n.dart';
import 'package:buy_and_dot/core/presentation/widget/button/bottomSheet_text_button.dart';
import 'package:buy_and_dot/feature/settings/domain/entity/app_locale.dart';
import 'package:buy_and_dot/feature/settings/domain/service/app_settings_bloc.dart';


import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  //Был вариант сделать стейтлес виджетом, и прокидывать сюда блок, но это придется на каждом экране инициализировать AppSettingsBloc, где это не нужно. Не знаю как лучше.
  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;
  TextTheme get theme => Theme.of(context).textTheme;
  late final _appSettingsBloc = context.read<AppSettingsBloc>();
  final isDarkThemeActive = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerBuilder,
            const SizedBox(
              height: 16,
            ),
            _dropDownBuilder,
            const SizedBox(
              height: 24,
            ),
            _themeSwitcherBuilder,
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ));
  }

  Widget get _headerBuilder => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).settings,
            style:
                theme.titleLarge!.copyWith(color: ColorCollection.onSurfaceVar),
          ),
          BottomSheetTextButton(
            text: S.of(context).done,
            onTap: context.pop,
          ),
        ],
      );
  Widget get _dropDownBuilder => DropdownMenu<AppLocale>(
      width: screenWidth - 32,
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle:
            theme.bodyLarge!.copyWith(color: ColorCollection.primary),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              color: ColorCollection.primary,
              width: 3), // Убираем границу, оставляя только закругления
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
              color: ColorCollection.outline,
              width: 1), // Убираем границу, оставляя только закругления
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
          .toList());
  Widget get _themeSwitcherBuilder => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).darkTheme,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          ValueListenableBuilder(
            valueListenable: isDarkThemeActive,
            builder: (context, value, child) => Switch(
                value: value,
                onChanged: (value) => isDarkThemeActive.value = value),
          ),
        ],
      );
}
