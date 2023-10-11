part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final ThemeMode themeMode;
  final Locale locale;
  final bool offlineMode;

  const SettingsState({
    required this.themeMode,
    required this.locale,
    required this.offlineMode,
  });

  factory SettingsState.normal() {
    return SettingsState(
      themeMode: DefualtBoxValues.themeMode,
      locale: DefualtBoxValues.locale,
      offlineMode: DefualtBoxValues.offlineMode,
    );
  }

  SettingsState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
    bool? offlineMode,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
      offlineMode: offlineMode ?? this.offlineMode,
    );
  }

  bool get isDark => themeMode == ThemeMode.dark;
  String? get fontFamily => locale.languageCode == "ar" ? "Kufi" : null;

  @override
  List<Object?> get props => [themeMode, locale, isDark, offlineMode];
}
