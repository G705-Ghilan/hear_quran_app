import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/services/services.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> with MainBoxMixin {
  SettingsCubit()
      : super(SettingsState(
          themeMode: DefualtBoxValues.themeMode,
          locale: DefualtBoxValues.locale,
        ));

  void setThemeMode(ThemeMode mode) {
    emit(state.copyWith(themeMode: mode));
  }

  void switchTheme(bool toDark) {
    final ThemeMode mode = toDark ? ThemeMode.dark : ThemeMode.light;
    set(BoxKeys.themeMode, mode.index);
    setThemeMode(mode);
  }

  void setlanguage(String code) {
    set(BoxKeys.language, code);
    emit(state.copyWith(locale: Locale(code)));
  }
}
