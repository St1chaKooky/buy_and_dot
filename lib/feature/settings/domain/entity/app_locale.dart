import 'package:flutter/material.dart';

class AppLocale extends Locale {
  final String name;

  AppLocale({
    required this.name,
    required final String languageCode,
    final String? countryCode,
  }) : super(languageCode, countryCode);
}
