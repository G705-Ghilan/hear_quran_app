import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hear_quran/core/usecase/usecase.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/usecases/usecases.dart';
import 'package:hear_quran/services/services.dart';

part 'quran_player_state.dart';

class QuranPlayerCubit extends Cubit<QuranPlayerState> with MainBoxMixin {
  QuranPlayerCubit()
      : super(QuranPlayerState.normal());

  Future<void> selectReciter(int reciterId) async {
    set(BoxKeys.reciter, reciterId);
    final QuranPlayerState newState = state.copyWith(
      selectedReciterId: reciterId,
      surahs: sl<GetReciterSurahs>()(reciterId),
    );
    // set the surah as the last selectedReciter surah if available also go to first
    final int id = state.surahs[state.playingSurahIndex].id;
    int index = newState.surahs.indexWhere((surah) => surah.id == id);
    index = index == -1 ? 0 : index;
    set(BoxKeys.lastSurah, index);
    logger.i((
      index,
      id,
      state.surahs[state.playingSurahIndex],
      state.playingSurahIndex
    ));
    emit(newState.copyWith(playingSurahIndex: index));
    await sl.get<QuranPlayer>().setReciter(ReciterParams(
          reciter: newState.selectedReciter,
          index: index,
        ));
  }



  void setMiniPlayer(bool show) {
    if (state.miniPlayer != show) {
      set(BoxKeys.showMiniPlayer, show);
      emit(state.copyWith(miniPlayer: show));
    }
    ;
  }

  void setPlayingSurahIndex(int index) {
    if (state.playingSurahIndex != index) {
      set(BoxKeys.lastSurah, index);
      emit(state.copyWith(playingSurahIndex: index));
    }
  }

  void favoriteSurah(int surahId) {
    set(BoxKeys.favorites, state.favorites + [surahId]);
    emit(state.copyWith(favorites: state.favorites + [surahId]));
  }

  void unFavoredSurah(int surahId) {
    final favorites = List<int>.from(state.favorites)..remove(surahId);
    set(BoxKeys.favorites, favorites);
    emit(state.copyWith(favorites: favorites));
  }
}
