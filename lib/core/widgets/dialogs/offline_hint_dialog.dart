import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';

class OfflineHintDialog extends StatelessWidget {
  const OfflineHintDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
      title: Text(context.lang.offlineMode),
      content: Text(context.lang.offlineHint),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(context.lang.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.go("/settings");
          },
          child: Text(context.lang.settings),
        ),
      ],
    );
  }

  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const OfflineHintDialog();
      },
    );
  }
}
