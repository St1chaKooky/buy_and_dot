import 'package:buy_and_dot/theme/collections/color_collection.dart/color_manager.dart';
import 'package:buy_and_dot/theme/themes/themeColor.dart';
import 'package:buy_and_dot/theme/themes/themeText.dart';
import 'package:flutter/material.dart';

final themeData = ThemeData(
    appBarTheme:
        const AppBarTheme(elevation: 0, color: ColorCollection.surface),
    colorScheme: themeColor,
    useMaterial3: true,
    textTheme: textTheme);
