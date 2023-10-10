import 'package:hear_quran/core/usecase/usecase.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/repository/quran_repository.dart';

class GetReciters extends Usecase<List<Reciter>, NoParams> {
  final QuranRepository _repo;

  GetReciters(this._repo);

  @override
  List<Reciter> call(NoParams params) {
    return _repo.getReciters();
  }
}
