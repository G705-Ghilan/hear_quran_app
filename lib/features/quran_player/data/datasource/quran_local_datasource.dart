import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hear_quran/features/quran_player/data/models/reciter_mode.dart';
import 'package:hear_quran/features/quran_player/data/models/surah_model.dart';

typedef DBType = List<Map<String, dynamic>>;

abstract class QuranLocalDataSource {
  List<ReciterModel> getReciters();
  List<SurahModel> getReciterSurahs(int reciterId);
}

class QuranLocalDataSourceImpl extends QuranLocalDataSource {
  late final List<ReciterModel> reciters;
  late final List<SurahModel> surahs;

  final String _surahs = "assets/quran/surahs.json";
  final String _reciters = "assets/quran/reciters.json";

  Future<QuranLocalDataSource> call() async {
    final [DBType surahsJsons, DBType recitersJsons] = [
      DBType.from(json.decode(await rootBundle.loadString(_surahs))),
      DBType.from(json.decode(await rootBundle.loadString(_reciters)))
    ];

    surahs = [
      for (final (id, json) in surahsJsons.indexed)
        SurahModel.fromJson(json, id + 1)
    ];
    reciters = [
      for (final (id, json) in recitersJsons.indexed)
        ReciterModel.fromJson(json, id)
    ];
    return this;
  }

  @override
  List<SurahModel> getReciterSurahs(int reciterId) {
    final currentReciter = reciters[reciterId];
    return currentReciter.unAvailables.isEmpty
        ? surahs
        : [
            for (final (id, surah) in surahs.indexed)
              if (!currentReciter.unAvailables.contains(id + 1)) surah
          ];
  }

  @override
  List<ReciterModel> getReciters() {
    return reciters;
  }
}
