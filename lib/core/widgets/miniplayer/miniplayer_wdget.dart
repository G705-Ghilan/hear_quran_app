import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:miniplayer/miniplayer.dart';
import 'miniplayer.dart';

class MiniPlayerWidget extends StatelessWidget {
  const MiniPlayerWidget({super.key});
  static final MiniplayerController controller = MiniplayerController();

  @override
  Widget build(BuildContext context) {
    return Miniplayer(
      minHeight: 70,
      controller: controller,
      maxHeight: MediaQuery.of(context).size.height,
      builder: (height, percent) {
        return Container(
          alignment: Alignment.center,
          color: Color.lerp(
            AppTheme.getSurfaceContainer(context),
            context.theme.scaffoldBackgroundColor,
            percent,
          ),
          child: Column(
            children: [
             
              MinPanelChild(
                height: height,
                percent: percent,
              ),
              if (percent < 0.2) const CustomProgressBar(),
            ],
          ),
        );
      },
    );
  }

  Color color(BuildContext context, double percent) {
    return Color.lerp(
      context.colorScheme.surface,
      context.theme.scaffoldBackgroundColor,
      percent,
    )!;
  }
}
