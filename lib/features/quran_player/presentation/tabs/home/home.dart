import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    List<String> tabs = [context.lang.surahs, context.lang.reciters];

    return SafeArea(
      child: Padding(
        padding: AppTheme.padding.copyWith(bottom: 0),
        child: Column(
          children: [
            CustomSlidingSegmentedControl(
              initialValue: navigationShell.currentIndex,
              children: {
                for (int i = 0; i < tabs.length; i++)
                  i: Text(
                    tabs[i],
                    style: navigationShell.currentIndex == i
                        ? TextStyle(
                            fontWeight: FontWeight.w500,
                            color: context.colorScheme.onSecondaryContainer,
                          )
                        : TextStyle(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                  )
              },
              isStretch: true,
              innerPadding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppTheme.getSurfaceContainer(context),
                borderRadius: AppTheme.radius,
              ),
              thumbDecoration: BoxDecoration(
                color: context.theme.colorScheme.secondaryContainer,
                borderRadius: AppTheme.radius,
              ),
              duration: AppTheme.duration,
              onValueChanged: navigationShell.goBranch,
            ),
            Expanded(
              child: navigationShell,
            ),
          ],
        ),
      ),
    );
  }
}
