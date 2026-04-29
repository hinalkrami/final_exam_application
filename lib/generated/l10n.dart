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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sing up`
  String get singUp {
    return Intl.message('Sing up', name: 'singUp', desc: '', args: []);
  }

  /// `Something went wrong try again after  some times...`
  String get somethingWentWrongTryAgainAfterSomeTimes {
    return Intl.message(
      'Something went wrong try again after  some times...',
      name: 'somethingWentWrongTryAgainAfterSomeTimes',
      desc: '',
      args: [],
    );
  }

  /// `Request can not be handle try after sometimes..`
  String get requestCanNotBeHandleTryAfterSometimes {
    return Intl.message(
      'Request can not be handle try after sometimes..',
      name: 'requestCanNotBeHandleTryAfterSometimes',
      desc: '',
      args: [],
    );
  }

  /// `Requested server is canceled`
  String get requestedServerIsCanceled {
    return Intl.message(
      'Requested server is canceled',
      name: 'requestedServerIsCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Connection time out with server`
  String get connectionTimeOutWithServer {
    return Intl.message(
      'Connection time out with server',
      name: 'connectionTimeOutWithServer',
      desc: '',
      args: [],
    );
  }

  /// `Error during communication`
  String get errorDuringCommunication {
    return Intl.message(
      'Error during communication',
      name: 'errorDuringCommunication',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Request`
  String get invalidRequest {
    return Intl.message(
      'Invalid Request',
      name: 'invalidRequest',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Input`
  String get invalidInput {
    return Intl.message(
      'Invalid Input',
      name: 'invalidInput',
      desc: '',
      args: [],
    );
  }

  /// `Server side error`
  String get serverSideError {
    return Intl.message(
      'Server side error',
      name: 'serverSideError',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `User Name`
  String get userName {
    return Intl.message('User Name', name: 'userName', desc: '', args: []);
  }

  /// `DOB`
  String get dob {
    return Intl.message('DOB', name: 'dob', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Profile Page`
  String get profilePage {
    return Intl.message(
      'Profile Page',
      name: 'profilePage',
      desc: '',
      args: [],
    );
  }

  /// `Choose from gallery`
  String get chooseFromGallery {
    return Intl.message(
      'Choose from gallery',
      name: 'chooseFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Take photo`
  String get takePhoto {
    return Intl.message('Take photo', name: 'takePhoto', desc: '', args: []);
  }

  /// `25% COMPLETE`
  String get complete25 {
    return Intl.message('25% COMPLETE', name: 'complete25', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
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
