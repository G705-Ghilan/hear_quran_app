import 'package:hear_quran/features/quran_player/data/datasource/quran_local_datasource.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/repository/quran_repository.dart';

class QuranRepositoryImpl extends QuranRepository {
  final QuranLocalDataSource dataSource;

  QuranRepositoryImpl(this.dataSource);

  @override
  List<Surah> getReciterSurahs(int reciterId) {
    return dataSource.getReciterSurahs(reciterId);
  }

  @override
  List<Reciter> getReciters() {
    return dataSource.getReciters();
  }
}
