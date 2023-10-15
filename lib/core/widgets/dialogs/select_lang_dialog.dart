import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';

class SelectLangDialog extends StatelessWidget {
  const SelectLangDialog({super.key});

  static Map<String, String> languages = {
    "ar": "عربي",
    "en": "English",
    "zh": "中文", // chinese
    "de": "Deutsch", // German
    "tr": "Türkçe", //  Turkish
    "fr": "Français", //  French
    "es": "Español", // Spanish
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
      contentPadding: AppTheme.padding,
      content: Column(
          mainAxisSize: MainAxisSize.min,
          children: languages.keys.map((code) {
            return RadioListTile(
              groupValue: true,
              shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
              title: Text(languages[code]!),
              value: context.currentCode == code,
              onChanged: (s) {
                Navigator.pop(context, code);
              },
            );
          }).toList()),
    );
  }

  static Future<T?> show<T>(BuildContext context) async {
    return await showDialog<T>(
      context: context,
      builder: (context) {
        return const SelectLangDialog();
      },
    );
  }
}
