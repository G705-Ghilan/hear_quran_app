import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/general/general.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/services/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:like_button/like_button.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.surah,
    required this.isLiked,
    this.onTap,
    this.selected = false,
    this.offline = false,
  });

  factory SurahItem.fromState(
    BuildContext context,
    QuranPlayerState state,
    int index,
    Surah surah,
    bool selected,
  ) {
    final QuranPlayer player = sl.get<QuranPlayer>();
    final bool isOffline =
        player.externalSurah(state.selectedReciter.en, surah.id).existsSync();

    return SurahItem(
      surah: surah,
      isLiked: state.favorites.contains(surah.id),
      selected: selected,
      offline: isOffline,
      onTap: () async {
        logger.i("Taped");
        if (context.read<SettingsCubit>().state.offlineMode) {
          if (!isOffline) {
            OfflineHintDialog.show(context);
            return;
          }
        }
        // else if (!ConnectionObserver.connected && !isOffline) {
        //   NoConnectionDialog.show(context);
        //   return;
        // }
        context.read<QuranPlayerCubit>()
          ..setMiniPlayer(true)
          ..setPlayingSurahIndex(index);

        if (!selected) {
          await player.seekIndex(index);
          await player.play();
        } else {
          await player.switchPlaying();
        }
      },
    );
  }

  final Surah surah;
  final bool isLiked;
  final void Function()? onTap;
  final bool selected;
  final bool offline;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppTheme.duration * 0.5,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: AppTheme.padding,
        decoration: BoxDecoration(
          borderRadius: AppTheme.radius,
          border: Border.all(
            color: selected
                ? context.colorScheme.primary
                : context.colorScheme.outlineVariant,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (selected)
              StreamBuilder(
                stream: sl.get<QuranPlayer>().player.playingStream,
                builder: (context, snapshot) {
                  return Icon(
                    snapshot.data ?? false
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: context.colorScheme.primary,
                    size: 45,
                  );
                },
              ),
            if (!selected)
              Icon(
                Icons.play_arrow_rounded,
                color: context.colorScheme.primary,
                size: 45,
              ),
            const SizedBox(width: 10),
            Wrap(
              direction: Axis.vertical,
              children: [
                Text(
                  surah.getName(context.currentCode),
                  style: context.isArabic
                      ? context.textTheme.titleLarge?.copyWith(
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        )
                      : context.textTheme.titleMedium,
                ),
                if (context.isArabic) const SizedBox(height: 5),
                Row(
                  children: [
                    if (offline) ...[
                      Icon(
                        Icons.offline_pin,
                        size: 12.0,
                        color: context.colorScheme.primary,
                      ),
                      const SizedBox(width: 2),
                    ],
                    Text(
                      "${surah.verses} ${context.lang.verses}",
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            if (!context.isArabic)
              Text(
                surah.arName,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colorScheme.primary,
                ),
              ),
            const SizedBox(width: 10),
            LikeButton(
              size: 20,
              likeCountAnimationDuration: Duration.zero,
              circleColor: CircleColor(
                start: context.colorScheme.primary,
                end: context.colorScheme.surfaceTint,
              ),
              bubblesColor: BubblesColor(
                dotPrimaryColor: context.colorScheme.primary,
                dotSecondaryColor: context.colorScheme.secondary,
              ),
              likeBuilder: (isLiked) {
                return Icon(
                  isLiked
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: isLiked
                      ? context.colorScheme.primary
                      : context.colorScheme.outlineVariant.withOpacity(0.3),
                );
              },
              isLiked: isLiked,
              onTap: (isLike) async {
                if (!isLike) {
                  context.read<QuranPlayerCubit>().favoriteSurah(surah.id);
                } else {
                  context.read<QuranPlayerCubit>().unFavoredSurah(surah.id);
                }
                return !isLike;
              },
            ),
          ],
        ),
      ),
    );
  }
}
