import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';

class SurahsSubTab extends StatelessWidget {
  const SurahsSubTab({super.key});
  static final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocPlayerStream(
      builder: (context, state, sequenceState) {
        if (sequenceState != null) {
          context
              .read<QuranPlayerCubit>()
              .setPlayingSurahIndex(sequenceState.currentIndex);
        }

        return ListView.builder(
          itemCount: state.surahs.length,
          shrinkWrap: true,
          controller: controller,
          itemBuilder: (context, index) => SurahItem.fromState(
            context,
            state,
            index,
            state.surahs[index],
            sequenceState,
          ),
        );
      },
    );
  }
}
