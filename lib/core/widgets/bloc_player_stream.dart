import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/services/audio_player/quran_player.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio/just_audio.dart';

typedef BuildFunc = Widget Function(
  BuildContext context,
  QuranPlayerState state,
  SequenceState? sequenceState,
);

class BlocPlayerStream extends StatelessWidget {
  const BlocPlayerStream({super.key, required this.builder});
  final BuildFunc builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState?>(
      stream: sl.get<QuranPlayer>().player.sequenceStateStream,
      builder: (context, snapshot) {
        return BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
          builder: (context, state) {
            return builder(context, state, snapshot.data);
          },
        );
      },
    );
  }
}
