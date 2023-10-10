import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/services/audio_player/quran_player.dart';
import 'package:hear_quran/services/services.dart';
import 'package:just_audio/just_audio.dart';
import 'miniplayer.dart';

class MaxPanelChild extends StatelessWidget {
  const MaxPanelChild(
      {super.key,
      required this.percent,
      required this.state,
      required this.currentSurah});
  final double percent;
  final QuranPlayerState state;
  final Surah currentSurah;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: lerpInt(-2, 1, percent, 1, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: AppTheme.radius,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  Images.reciterImg(state.selectedReciter.imgPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              currentSurah.getName(context.currentCode),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.colorScheme.onSurface.withOpacity(0.3),
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              state.selectedReciter.getName(context.currentCode),
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.titleMedium,
            ),
            const CustomProgressBar(
              withTimeLabel: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder<bool>(
                  stream: sl.get<QuranPlayer>().player.shuffleModeEnabledStream,
                  builder: (context, snapshot) {
                    final shuffleModeEnabled = snapshot.data ?? false;
                    return IconButton(
                      icon: Icon(
                        Icons.shuffle,
                        color: context.colorScheme.primary
                            .withOpacity(shuffleModeEnabled ? 1 : 0.5),
                      ),
                      onPressed: () async {
                        final enable = !shuffleModeEnabled;
                        MainBox.set(BoxKeys.shufle, enable);
                        if (enable) {
                          await sl.get<QuranPlayer>().player.shuffle();
                        }
                        await sl
                            .get<QuranPlayer>()
                            .player
                            .setShuffleModeEnabled(enable);
                      },
                    );
                  },
                ),
                IconButton(
                  onPressed: () async {
                    await sl.get<QuranPlayer>().player.seekToPrevious();
                  },
                  icon: Icon(Icons.skip_previous_rounded),
                  color: context.colorScheme.primary,
                  iconSize: 40,
                ),
                PlayIcon(
                  size: 50,
                  color: context.colorScheme.primary,
                ),
                IconButton(
                  onPressed: () async {
                    // await sl.get<QuranPlayer>().player.seekToNext();
                    await sl.get<QuranPlayer>().player.seekToNext();
                  },
                  icon: const Icon(Icons.skip_next_rounded),
                  color: context.colorScheme.primary,
                  iconSize: 40,
                ),
                StreamBuilder<LoopMode>(
                  stream: sl.get<QuranPlayer>().player.loopModeStream,
                  builder: (context, snapshot) {
                    final loopMode = snapshot.data ?? DefualtBoxValues.loopMode;
                    final Color color = context.colorScheme.primary;
                    MainBox.set(BoxKeys.loopMode, loopMode.index);

                    final icons = [
                      Icon(Icons.repeat, color: color.withOpacity(0.5)),
                      Icon(Icons.repeat, color: color),
                      Icon(Icons.repeat_one, color: color),
                    ];
                    const cycleModes = [
                      LoopMode.off,
                      LoopMode.all,
                      LoopMode.one,
                    ];
                    final index = cycleModes.indexOf(loopMode);
                    return IconButton(
                      icon: icons[index],
                      onPressed: () {
                        sl.get<QuranPlayer>().player.setLoopMode(
                              cycleModes[(cycleModes.indexOf(loopMode) + 1) %
                                  cycleModes.length],
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
