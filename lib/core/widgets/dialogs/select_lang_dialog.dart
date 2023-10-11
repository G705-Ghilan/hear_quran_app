import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/core/resources/theme.dart';
import 'package:hear_quran/features/general/general.dart';

class SelectLangDialog extends StatelessWidget {
  const SelectLangDialog({super.key});

  static Map<String, String> languages = {
    "ar": "عربي",
    "en": "English",
    "zh": "中文", // chinese
    "de": "Deutsch", // German
    "tr": "Türkçe", //  Turkish
    "fr": "Français", //  French
     "es":"Español", // Spanish  
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
      contentPadding: AppTheme.padding,
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.keys.map((code) {
            return ListTile(
              shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
              title: Text(languages[code]!),
              onTap: () {
                context.read<SettingsCubit>().setlanguage(code);
                Navigator.pop(context);
              },
            );
          }).toList()),
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
