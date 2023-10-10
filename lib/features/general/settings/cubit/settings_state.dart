part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  const SettingsState({required this.themeMode, required this.locale});

  final ThemeMode themeMode;
  final Locale locale;

  SettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  bool get isDark => themeMode == ThemeMode.dark;
  String? get fontFamily => locale.languageCode == "ar" ? "Kufi" : null;

  @override
  List<Object?> get props => [themeMode, locale, isDark];
}
