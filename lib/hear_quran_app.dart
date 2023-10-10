import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hear_quran/core/app_route.dart';
import 'package:hear_quran/core/localization/localization.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:hear_quran/features/general/general.dart';

class HearQuranApp extends StatelessWidget {
  const HearQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return AnnotatedRegion(
          value: AppTheme.setDeviceSafeEreasThemeAuto(state.isDark),
          child: WithObserver(
            child: MaterialApp.router(
              routerConfig: routes,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: Strings.localizationsDelegates,
              supportedLocales: Strings.supportedLocales,
              theme: AppTheme.lightThemeMode(state.fontFamily),
              darkTheme: AppTheme.darkThemeMode(state.fontFamily),
              themeMode: state.themeMode,
              locale: state.locale,
            ),
          ),
        );
      },
    );
  }
}
