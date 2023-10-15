import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/core/widgets/widgets.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.padding.copyWith(bottom: 0, top: 0),
      child: BlocPlayerStream(
        builder: (context, state, sequenceState) {
          final List<Surah> favorites = state.favoritesSurahs;
          return favorites.isEmpty
              ? empty(context)
              : ListView.builder(
                  itemCount: favorites.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Surah surah = favorites[index];
                    return SurahItem.fromState(
                      context,
                      state,
                      state.surahs.indexOf(surah),
                      surah,
                      state.playingSurah.id == surah.id,
                    );
                  },
                );
        },
      ),
    );
  }

  empty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border_rounded,
            color: context.colorScheme.onBackground.withOpacity(0.6),
          ),
          Text(
            context.lang.noFav,
            style: TextStyle(
              color: context.colorScheme.onBackground.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
