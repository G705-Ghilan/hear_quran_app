import 'package:flutter/material.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/services/hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class RateUsDialog extends StatelessWidget {
  const RateUsDialog({super.key});
  static const String _appLink =
      "http://play.google.com/store/apps/details?id=com.psh.hear_quran";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppTheme.radius),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Lottie.asset("assets/animated/star.json", width: 114),
          const SizedBox(height: 20),
          Text(
            context.lang.likeUsingApp,
            textAlign: TextAlign.center,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            context.lang.likeUsingAppDes,
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: AppTheme.radius),
                    ),
                    textStyle: const MaterialStatePropertyAll(
                      TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () => openPlayStore(context),
                  child: Text(context.lang.rateUs),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Future show(BuildContext context) async {
    final bool? result = await showDialog<bool>(
      context: context,
      builder: (context) {
        return RateUsDialog();
      },
    );
    if (DefualtBoxValues.opensCount >= 0) {
      await MainBox.set(BoxKeys.opensCount, result == true ? -1 : 0);
      DefualtBoxValues.opensCount = result == true ? -1 : 0;
    }
  }

  Future openPlayStore(BuildContext context) async {
    try {
      launchUrl(
        Uri.parse(_appLink),
        mode: LaunchMode.externalApplication,
      ).then(
        (_) => Navigator.pop(context, true),
      );
    } catch (e, st) {
      logger.e(
        "error when open app on google play to rate it",
        error: e,
        stackTrace: st,
      );
    }
  }
}
