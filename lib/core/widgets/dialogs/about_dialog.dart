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
      titlePadding: AppTheme.padding * 1.5,
      actionsPadding: AppTheme.padding * 1.5,
      title: Row(
        children: [
          Image.asset(
            "assets/images/icons/app_icon.png",
            width: 50,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.lang.aboutAppSub),
              Text(
                "1.0.2",
                style: context.textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
      content: Text(context.lang.aboutDes),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(context.lang.ok),
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
