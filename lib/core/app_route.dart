import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/features/general/general.dart';
import 'package:hear_quran/features/general/permissions/permissions_page.dart';
import 'package:hear_quran/features/quran_player/presentation/navigator_wrapper.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/favorites.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/home/home.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/home/reciters_sub_tab.dart';
import 'package:hear_quran/features/quran_player/presentation/tabs/home/surahs_sub_tab.dart';
import 'package:hear_quran/services/services.dart';

enum Routes {
  homeSurahs("/home/surahs"),
  homeReciters("/home/reciters"),
  favorites("/favorites"),
  settings("/settings"),
  permissions("/permissions"),
  licenses("/licenses");

  final String path;
  const Routes(this.path);
}

final routes = GoRouter(
  initialLocation: Routes.homeSurahs.path,
  redirect: (context, state) {
    if (!PermissionsHandler.filesAllowed) {
      return Routes.permissions.path;
    }
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigatorWrapper(navigationShell: navigationShell);
      },
      branches: [
        // quran with its tabs surahs, reciters
        StatefulShellBranch(
          initialLocation: Routes.homeSurahs.path,
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
                      path: Routes.homeSurahs.path,
                    ),
                  ],
                ),
                StatefulShellBranch(
                  routes: [
                    GoRoute(
                      builder: (context, state) => const RecitersSubTab(),
                      path: Routes.homeReciters.path,
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
              path: Routes.favorites.path,
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              builder: (context, state) => const SettingsTab(),
              path: Routes.settings.path,
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: Routes.licenses.path,
      builder: (context, state) => LicensePage(
        applicationName: context.lang.aboutAppSub,
        applicationVersion: "1.0.3",
      ),
    ),
    GoRoute(
      path: Routes.permissions.path,
      builder: (context, state) => const PermissionsPage(),
    ),
  ],
);
