// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get logIn {
    return Intl.message(
      'Login',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get signUp {
    return Intl.message(
      'Signup',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get toComeIn {
    return Intl.message(
      'Login',
      name: 'toComeIn',
      desc: '',
      args: [],
    );
  }

  /// `Signup`
  String get toComeUp {
    return Intl.message(
      'Signup',
      name: 'toComeUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeatPassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `I agree with`
  String get iAgreeWith {
    return Intl.message(
      'I agree with',
      name: 'iAgreeWith',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms and Conditions of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Password recovery`
  String get passwordRecovery {
    return Intl.message(
      'Password recovery',
      name: 'passwordRecovery',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone to which the password reset code will be sent`
  String get enterThePhoneTo {
    return Intl.message(
      'Enter the phone to which the password reset code will be sent',
      name: 'enterThePhoneTo',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Enter a code`
  String get enterACode {
    return Intl.message(
      'Enter a code',
      name: 'enterACode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code sent to`
  String get enterTheCodeSentTo {
    return Intl.message(
      'Enter the code sent to',
      name: 'enterTheCodeSentTo',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resendCode {
    return Intl.message(
      'Resend code',
      name: 'resendCode',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Set a new password and confirm it to complete the reset.`
  String get setANewPassword {
    return Intl.message(
      'Set a new password and confirm it to complete the reset.',
      name: 'setANewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Save new password`
  String get saveNewPassword {
    return Intl.message(
      'Save new password',
      name: 'saveNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message(
      'Dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Tiraspol`
  String get tiraspol {
    return Intl.message(
      'Tiraspol',
      name: 'tiraspol',
      desc: '',
      args: [],
    );
  }

  /// `Rybnitsa`
  String get rybnitsa {
    return Intl.message(
      'Rybnitsa',
      name: 'rybnitsa',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get my {
    return Intl.message(
      'My',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `Search advertisements`
  String get searchPost {
    return Intl.message(
      'Search advertisements',
      name: 'searchPost',
      desc: '',
      args: [],
    );
  }

  /// `Advertisements`
  String get advertisements {
    return Intl.message(
      'Advertisements',
      name: 'advertisements',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Add city`
  String get addCity {
    return Intl.message(
      'Add city',
      name: 'addCity',
      desc: '',
      args: [],
    );
  }

  /// `Ad price`
  String get adPrice {
    return Intl.message(
      'Ad price',
      name: 'adPrice',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Before`
  String get before {
    return Intl.message(
      'Before',
      name: 'before',
      desc: '',
      args: [],
    );
  }

  /// `You dont have any ads yet`
  String get notHaveAnyAds {
    return Intl.message(
      'You dont have any ads yet',
      name: 'notHaveAnyAds',
      desc: '',
      args: [],
    );
  }

  /// `Dont miss the opportunity! Create and publish your ad right now to offer products or services to a wide audience`
  String get notHaveAnyAdsText {
    return Intl.message(
      'Dont miss the opportunity! Create and publish your ad right now to offer products or services to a wide audience',
      name: 'notHaveAnyAdsText',
      desc: '',
      args: [],
    );
  }

  /// `Add ads to favorites`
  String get addAdsToFav {
    return Intl.message(
      'Add ads to favorites',
      name: 'addAdsToFav',
      desc: '',
      args: [],
    );
  }

  /// `You can come back to them later`
  String get YouCanComeBack {
    return Intl.message(
      'You can come back to them later',
      name: 'YouCanComeBack',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
