import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hear_quran/core/app_route.dart';
import 'package:hear_quran/core/extenstions.dart';
import 'package:hear_quran/core/resources/resources.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/services/services.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final [w, h] = [constraints.maxWidth, constraints.maxHeight];
                final s = w < h ? w : h;
                return Stack(
                  children: <Widget>[
                    Positioned(
                      left: w * 0.8,
                      top: h * 0.1,
                      child: image("7.jpg", s * 0.1),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: image("8.jpg", s * 0.09),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: image("1.png", s * 0.2),
                    ),
                    Positioned(
                      left: w * 0.2,
                      top: h * 0.2,
                      child: image("2.jpg", s * 0.12),
                    ),
                    Positioned(
                      left: w * 0.55,
                      top: h * 0.55,
                      child: image("10.jpg", s * 0.15),
                    ),
                    Positioned(
                      left: w * 0.1,
                      top: h * 0.6,
                      child: image("6.jpg", s * 0.14),
                    ),
                    Positioned(
                      left: w * 0.6,
                      top: h * 0.1,
                      child: image("3.jpg", s * 0.09),
                    ),
                    Positioned(
                      left: w * 0.84,
                      top: h * 0.4,
                      child: image("4.jpg", s * 0.1),
                    ),
                    Positioned(
                      left: w * 0.0,
                      top: h * 0.4,
                      child: image("5.jpg", s * 0.09),
                    ),
                    Positioned(
                      left: w * 0.75,
                      top: h * 0.8,
                      child: image("9.jpg", s * 0.09),
                    ),
                    Positioned(
                      left: w * 0.0,
                      top: h * 0.8,
                      child: image("12.jpg", s * 0.09),
                    ),
                    Positioned(
                      left: w * 0.0,
                      top: h * 0.1,
                      child: image("13.jpg", s * 0.1),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: AppTheme.padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    context.lang.permissions,
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    context.lang.permissionsDes,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: context.textTheme.titleMedium?.color
                          ?.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async => await onAllowClicked(context),
            child: Container(
              margin: AppTheme.padding.copyWith(bottom: 20),
              padding: AppTheme.padding,
              alignment: Alignment.center,
              height: 50,
              // width: 50,
              decoration: BoxDecoration(
                borderRadius: AppTheme.radius,
                color: context.colorScheme.primary,
              ),
              child: Text(
                context.lang.allow,
                style: TextStyle(
                  color: context.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CircleAvatar image(String image, [double radius = 40]) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(Images.reciterImg(image)),
    );
  }

  Future<void> onAllowClicked(BuildContext context) async {
    await PermissionsHandler.askForStorage();
    if (PermissionsHandler.filesAllowed) {
      context.go(Routes.homeSurahs.path);
      try {
        await sl.get<QuranPlayer>().init();
      } catch (e, t) {
        logger.e("error on permissions page", error: e, stackTrace: t);
      }
    }
  }
}
