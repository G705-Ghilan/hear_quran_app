import 'package:flutter/material.dart';
import 'package:hear_quran/core/localization/localization.dart';

extension ContextPlus on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  Strings get lang => Strings.of(this)!;
  Locale get currentLocale => Localizations.localeOf(this);
  String get currentCode => currentLocale.languageCode;
  bool get isArabic => currentCode == "ar";
}
