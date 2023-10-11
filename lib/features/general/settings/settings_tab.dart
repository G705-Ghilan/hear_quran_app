import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';
import 'package:hear_quran/core/widgets/widgets.dart';
import 'package:hear_quran/features/general/general.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: AppTheme.padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headline(title: context.lang.general),
              BlocBuilder<SettingsCubit, SettingsState>(
                buildWhen: (previous, current) {
                  return previous.themeMode != current.themeMode;
                },
                builder: (context, state) {
                  return SettingItem(
                    value: state.isDark,
                    onChanged: context.read<SettingsCubit>().switchTheme,
                    title: context.lang.darkMode,
                    subtitle: context.lang.darkModeSub,
                  );
                },
              ),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return SettingItem(
                    value: state.offlineMode,
                    onChanged: (isOffline) {
                      context.read<SettingsCubit>().switchOfflineMode(
                            isOffline,
                            context
                                .read<QuranPlayerCubit>()
                                .state
                                .selectedReciter,
                          );
                    },
                    title: context.lang.offlineMode,
                    subtitle: context.lang.offlineModeDes,
                  );
                },
              ),
              SettingItem(
                title: context.lang.language,
                subtitle: langName(context),
                onTap: () {
                  SelectLangDialog.show(context);
                },
              ),
              Headline(title: context.lang.app),
              SettingItem(
                title: context.lang.aboutApp,
                subtitle: context.lang.aboutAppSub,
                onTap: () {
                  AboutDialogApp.show(context);
                },
              ),
              SettingItem(
                title: context.lang.licenses,
                subtitle: context.lang.licensesSub,
                onTap: () {
                  context.push("/licenses");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String langName(BuildContext context) {
    return SelectLangDialog
        .languages[Localizations.localeOf(context).languageCode]!;
  }
}
