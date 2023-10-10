part of 'quran_player_cubit.dart';

final class QuranPlayerState extends Equatable {
  final List<Reciter> reciters;
  final List<Surah> surahs;
  final int selectedReciterId;
  final bool miniPlayer;
  final int playingSurahIndex;
  final List<int> favorites;

  const QuranPlayerState({
    required this.reciters,
    required this.surahs,
    required this.selectedReciterId,
    required this.miniPlayer,
    required this.playingSurahIndex,
    required this.favorites,
  });
  QuranPlayerState copyWith({
    List<Reciter>? reciters,
    List<Surah>? surahs,
    int? selectedReciterId,
    bool? miniPlayer,
    int? playingSurahIndex,
    List<int>? favorites,
  }) {
    return QuranPlayerState(
      reciters: reciters ?? this.reciters,
      surahs: surahs ?? this.surahs,
      selectedReciterId: selectedReciterId ?? this.selectedReciterId,
      miniPlayer: miniPlayer ?? this.miniPlayer,
      playingSurahIndex: playingSurahIndex ?? this.playingSurahIndex,
      favorites: favorites ?? this.favorites,
    );
  }

  Reciter get selectedReciter => reciters[selectedReciterId];
  Surah get playingSurah => surahs[playingSurahIndex];
  List<Surah> get favoritesSurahs {
    return surahs.where((surah) => favorites.contains(surah.id)).toList();
  }

  @override
  List<Object> get props => [
        reciters,
        surahs,
        selectedReciterId,
        selectedReciter,
        miniPlayer,
        playingSurahIndex,
        playingSurah,
        favorites,
        favoritesSurahs,
      ];
}
