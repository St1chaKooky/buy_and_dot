import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/themes/themeColor.dart';
import 'package:buy_and_dot/theme/themes/themeText.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (!states.contains(MaterialState.selected)) {
          return ColorCollection.surfaceContainerHightest;
        }
        return null;
      }),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      dragHandleColor: ColorCollection.outline,
      backgroundColor: ColorCollection.surfaceContainerLow,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      minimumSize: Size.zero,
    )),
    dividerColor: ColorCollection.outlineVariant,
    focusColor: ColorCollection.primary,
    appBarTheme:
        const AppBarTheme(elevation: 0, color: ColorCollection.surface),
    colorScheme: themeColor,
    useMaterial3: true,
    textTheme: textTheme);
