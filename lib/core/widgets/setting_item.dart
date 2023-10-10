import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/theme.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    this.onTap,
    required this.title,
    required this.subtitle,
    this.value,
    this.onChanged,
  });
  final void Function()? onTap;
  final bool? value;
  final void Function(bool value)? onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
      borderRadius: AppTheme.radius,
      side: BorderSide(
        color: context.colorScheme.outlineVariant,
      ),
    );
    return Padding(
      padding: AppTheme.padding.copyWith(left: 0, right: 0) * 0.5,
      child: value != null
          ? SwitchListTile(
              value: value!,
              onChanged: onChanged,
              title: Text(title),
              subtitle: Text(subtitle),
              dense: true,
              shape: shape,
            )
          : ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
              onTap: onTap,
              dense: true,
              shape: shape,
            ),
    );
  }
}
