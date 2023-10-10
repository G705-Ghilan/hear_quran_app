import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/services/audio_player/quran_player.dart';
import 'miniplayer.dart';

class MinPanelChild extends StatelessWidget {
  const MinPanelChild({
    super.key,
    required this.percent,
    required this.height,
  });
  final double percent;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocPlayerStream(
      builder: (context, state, sequenceState) {
        final Surah currentSurah =
            state.surahs[sequenceState?.currentIndex ?? 0];

        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: lerpInt(5, 20, percent),
              vertical:
                  lerpInt(5, MediaQuery.of(context).size.height / 15, percent),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: AppTheme.padding,
                  height: double.infinity,
                  width: min(height, MediaQuery.of(context).size.width) -
                      (17 + (40 - 17) * percent),
                  decoration: BoxDecoration(
                    borderRadius: AppTheme.radius,
                    border: percent > 0.5
                        ? Border.all(color: context.colorScheme.outlineVariant)
                        : null,
                    image: DecorationImage(
                      image: AssetImage(
                        Images.reciterImg(state.selectedReciter.imgPath),
                      ),
                      fit: BoxFit.cover,
                      opacity: lerpInt(1, -0.5, percent, 1, 0),
                    ),
                  ),
                  child: percent > 0.7
                      ? MaxPanelChild(
                          state: state,
                          percent: percent,
                          currentSurah: currentSurah,
                        )
                      : SizedBox(),
                ),
                if (percent < 0.2) ...[
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.selectedReciter.getName(context.currentCode),
                          overflow: TextOverflow.ellipsis,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          currentSurah.getName(context.currentCode),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color:
                                context.colorScheme.onSurface.withOpacity(0.3),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PlayIcon(),
                  IconButton(
                    onPressed: () async {
                      await sl.get<QuranPlayer>().player.stop().then((value) {
                        context.read<QuranPlayerCubit>().setMiniPlayer(false);
                      });
                    },
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
