import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';

class ReciterItem extends StatelessWidget {
  const ReciterItem({
    super.key,
    required this.reciter,
    this.onTap,
    required this.isSelected,
  });
  final Reciter reciter;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppTheme.radius,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppTheme.radius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppTheme.radius,
              border: Border.all(color: context.colorScheme.outlineVariant),
            ),
            child: Padding(
              padding: AppTheme.padding,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: isSelected
                            ? context.colorScheme.primary
                            : Colors.transparent,
                      ),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(Images.reciterImg(reciter.imgPath)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(
                        reciter.getName(context.currentCode),
                        style: context.textTheme.titleMedium,
                      ),
                      Text(
                        "${114 - reciter.unAvailables.length} ${context.lang.surah}",
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.textTheme.titleMedium?.color
                              ?.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
