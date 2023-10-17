import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:miniplayer/miniplayer.dart';

class NavigatorWrapper extends StatelessWidget {
  const NavigatorWrapper({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  static final List<int> _tabsHistory = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // make when click back back to the last open tab unitl the main and then exit ...
        if (_tabsHistory.isNotEmpty) {
          onDestinationSelected(_tabsHistory.removeLast(), false);
        }
        return _tabsHistory.isEmpty;
      },
      child: Scaffold(
        body: BlocBuilder<QuranPlayerCubit, QuranPlayerState>(
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: state.miniPlayer ? 70 : 0),
                  child: navigationShell,
                ),
                if (state.miniPlayer) const MiniPlayerWidget(),
              ],
            );
          },
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: onDestinationSelected,
          selectedIndex: navigationShell.currentIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home_filled),
              label: context.lang.home,
              tooltip: context.lang.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.favorite_border_rounded),
              selectedIcon: const Icon(Icons.favorite),
              label: context.lang.favorites,
              tooltip: context.lang.favorites,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings_rounded),
              label: context.lang.settings,
              tooltip: context.lang.settings,
            ),
          ],
        ),
      ),
    );
  }

  void onDestinationSelected(index, [bool add = true]) {
    MiniPlayerWidget.controller.animateToHeight(state: PanelState.MIN);
    if (add && index != navigationShell.currentIndex) _tabsHistory.add(navigationShell.currentIndex);
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
