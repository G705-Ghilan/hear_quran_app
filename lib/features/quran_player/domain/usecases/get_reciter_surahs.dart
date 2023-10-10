import 'package:hear_quran/core/usecase/usecase.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/repository/quran_repository.dart';

class GetReciterSurahs extends Usecase<List<Surah>, int> {
  final QuranRepository _repo;

  GetReciterSurahs(this._repo);

  @override
  List<Surah> call(int params) {
    return _repo.getReciterSurahs(params);
  }
}

