import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';

class AboutDialogApp extends StatelessWidget {
  const AboutDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
      contentPadding: AppTheme.padding * 1.5,
      title: Text(context.lang.aboutAppSub),
      content: Text(context.lang.aboutDes),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child:  Text(context.lang.ok),
        ),
      ],
    );
  }

  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const AboutDialogApp();
      },
    );
  }
}
