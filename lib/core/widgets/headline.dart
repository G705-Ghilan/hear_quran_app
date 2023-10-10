import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';

class Headline extends StatelessWidget {
  const Headline({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppTheme.padding.copyWith(left: 0) * 0.5,
      child: Text(
        title,
        style: TextStyle(
          color: context.colorScheme.onBackground.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
