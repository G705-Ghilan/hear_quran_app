import 'package:hear_quran/features/quran_player/domain/entities/reciter.dart';
import 'package:hear_quran/features/quran_player/domain/entities/surah.dart';

abstract class QuranRepository {
  List<Reciter> getReciters();
  List<Surah> getReciterSurahs(int reciterId);
}
