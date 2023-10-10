import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hear_quran/core/localization/localization.dart';
import 'package:hear_quran/core/usecase/usecase.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/usecases/usecases.dart';
import 'package:hear_quran/services/hive/main_box_mixin.dart';
import 'package:hear_quran/services/hive/enums.dart';
import 'package:just_audio/just_audio.dart';

class DefualtBoxValues with MainBoxMixin {
  static late ThemeMode themeMode;
  static late Locale locale;
  static late Reciter reciter;
  static late List<int> favorites;
  static late int lastSurah;
  static late Duration lastTime;
  static late bool showMiniPlayer;
  static late LoopMode loopMode;
  static late bool shufle;

  Future<void> initializeLastValues() async {
    themeMode = ThemeMode.values[get(BoxKeys.themeMode)];
    locale = Locale(get(BoxKeys.language) ?? defaultLocale.languageCode);
    reciter = sl.get<GetReciters>()(NoParams())[get(BoxKeys.reciter)];
    favorites = List<int>.from(get(BoxKeys.favorites));
    lastSurah = get(BoxKeys.lastSurah);
    lastTime = stringToDuration(get(BoxKeys.lastTime));
    showMiniPlayer = get(BoxKeys.showMiniPlayer);
    loopMode = LoopMode.values[get(BoxKeys.loopMode)];
    shufle = get(BoxKeys.shufle);
  }

  static Locale get defaultLocale {
    return Strings.supportedLocales.firstWhere(
      (locale) => Platform.localeName
          .toLowerCase()
          .startsWith(locale.languageCode.toLowerCase()),
      orElse: () => Strings.supportedLocales.first,
    );
  }

  static Duration stringToDuration(String stringTime) {
    final List<String> time = stringTime.split(":");
    time.add(time.removeLast().split(".").first);

    return Duration(
      hours: int.parse(time[0]),
      minutes: int.parse(time[1]),
      seconds: int.parse(time[2]),
    );
  }
}
