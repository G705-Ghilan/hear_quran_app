import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/features/general/general.dart';
import 'package:hear_quran/features/quran_player/presentation/navigator_wrapper.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/favorites.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/home/home.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/home/reciters_sub_tab.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/home/surahs_sub_tab.dart';

enum Routes {
  home("/"),
  favorites("favorites"),
  settings("/settings");

  final String path;
  const Routes(this.path);
}

final routes = GoRouter(
  initialLocation: "/home/surahs",
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigatorWrapper(navigationShell: navigationShell);
      },
      branches: [
        // quran with its tabs surahs, reciters
        StatefulShellBranch(
          initialLocation: "/home/surahs",
          routes: [
            StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return HomeTab(navigationShell: navigationShell);
              },
              branches: [
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      builder: (context, state) => const SurahsSubTab(),
                      path:"/home/surahs",
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      builder: (context, state) => const RecitersSubTab(),
                      path:"/reciters",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        // other pages
        StatefulShellBranch(
          routes: [
            GoRoute(
              builder: (context, state) => const FavoritesTab(),
              path:"/favorites",
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              builder: (context, state) => const SettingsTab(),
              path: "/settings",
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: "/licenses",
      builder: (context, state) => LicensePage(
        applicationName: context.lang.aboutAppSub,
        applicationVersion: "0.1.1",
      ),
    ),
  ],
);
