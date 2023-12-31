import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/services/audio_player/quran_player.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key, this.withTimeLabel = false});
  final bool withTimeLabel;
  static PositionData? positionData;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: sl.get<QuranPlayer>().positionDataStream,
      builder: (context, snapshot) {
        final PositionData? data = snapshot.data ?? positionData;
        if (data != null) {
          positionData = data;
        }
        return ProgressBar(
          timeLabelLocation: withTimeLabel ? null : TimeLabelLocation.none,
          thumbCanPaintOutsideBar: false,
          progress: data?.position ?? Duration.zero,
          buffered: data?.bufferedPosition ?? Duration.zero,
          total: data?.duration ?? Duration.zero,
          thumbRadius: withTimeLabel ? 10.0 : 3,
          thumbGlowRadius: withTimeLabel ? 20 : 0,
          barHeight: withTimeLabel ? 5 : 1.5,
          timeLabelTextStyle: context.textTheme.labelSmall,
          baseBarColor: context.colorScheme.primary.withOpacity(0.1),
          onSeek: (duration) async {
            if (data != null) {
              await sl.get<QuranPlayer>().player.seek(duration);
            }
          },
        );
      },
    );
  }
}
