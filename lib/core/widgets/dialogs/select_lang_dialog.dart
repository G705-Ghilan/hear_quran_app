import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';
import 'package:hear_quran/features/general/general.dart';

class SelectLangDialog extends StatelessWidget {
  const SelectLangDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
      contentPadding: AppTheme.padding,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
            title: Text(context.lang.ar),
            onTap: () {
              context.read<SettingsCubit>().setlanguage("ar");
              Navigator.pop(context);
            },
          ),
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
            title: Text(context.lang.en),
            onTap: () {
              context.read<SettingsCubit>().setlanguage("en");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const SelectLangDialog();
      },
    );
  }
}
