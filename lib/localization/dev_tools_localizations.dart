
import 'package:dev_tools_screen/localization/dev_tools_localizations_en.dart';
import 'package:dev_tools_screen/localization/dev_tools_localizations_kk.dart';
import 'package:dev_tools_screen/localization/dev_tools_localizations_ru.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _DevToolsLocalizationsDelegate
    extends LocalizationsDelegate<DevToolsLocalizations> {
  @override
  bool isSupported(Locale locale) =>
      <String>['kk', 'ru', 'en'].contains(locale.languageCode);

  @override
  Future<DevToolsLocalizations> load(Locale locale) =>
      SynchronousFuture<DevToolsLocalizations>(lookupAppLocalizations(locale));

  DevToolsLocalizations lookupAppLocalizations(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return DevToolsLocalizationsEn();
      case 'kk':
        return DevToolsLocalizationsKk();
      case 'ru':
        return DevToolsLocalizationsRu();
      default:
        return DevToolsLocalizationsEn();
    }
  }

  @override
  bool shouldReload(
    covariant LocalizationsDelegate<DevToolsLocalizations> old,
  ) => false;
}

abstract class DevToolsLocalizations {
  static final LocalizationsDelegate<DevToolsLocalizations> delegate =
      _DevToolsLocalizationsDelegate();

  String get talker;

  String get devTools;

  String get selectApiEndpoint;

  static DevToolsLocalizations of(BuildContext context) =>
      Localizations.of<DevToolsLocalizations>(context, DevToolsLocalizations)!;
}
