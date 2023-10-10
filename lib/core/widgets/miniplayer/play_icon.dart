import 'package:flutter/material.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/services/services.dart';
import 'package:just_audio/just_audio.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({
    super.key,
    this.size = 24,
    this.color,
  });
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl.get<QuranPlayer>().player.playerStateStream,
      builder: (context, snapshot) {
        if (snapshot.data == null ||
            snapshot.data!.processingState == ProcessingState.loading ||
            snapshot.data!.processingState == ProcessingState.buffering) {
          return IconButton(
            onPressed: () {},
            icon: SizedBox(
              width: size,
              height: size,
              child: const CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),
          );
        }

        return IconButton(
          onPressed: () async {
            await sl.get<QuranPlayer>().switchPlaying();
          },
          icon: Icon(
            snapshot.data!.playing
                ? Icons.pause_outlined
                : Icons.play_arrow_rounded,
            size: size,
            color: color,
          ),
        );
      },
    );
  }
}
