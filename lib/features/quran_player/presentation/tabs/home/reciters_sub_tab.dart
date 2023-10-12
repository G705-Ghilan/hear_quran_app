import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';

class RecitersSubTab extends StatelessWidget {
  const RecitersSubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.reciters.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final Reciter reciter = state.reciters[index];
            return ReciterItem(
              reciter: reciter,
              isSelected: state.selectedReciterId == index,
              onTap: () async {
                await context.read<QuranPlayerCubit>().selectReciter(index);
              },
            );
          },
        );
      },
    );
  }
}
