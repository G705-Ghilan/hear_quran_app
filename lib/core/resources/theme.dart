import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hear_quran/core/extenstions.dart';

class AppTheme {
  static SystemUiOverlayStyle setDeviceSafeEreasThemeToLight() {
    return const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFFF3EDF7),
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }

  static SystemUiOverlayStyle setDeviceSafeEreasThemeToDark() {
    return const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFF2A272E),
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }

  static SystemUiOverlayStyle setDeviceSafeEreasThemeAuto(bool isDark) {
    return isDark
        ? setDeviceSafeEreasThemeToDark()
        : setDeviceSafeEreasThemeToLight();
  }

  static final BorderRadius radius = BorderRadius.circular(10);
  static const EdgeInsets padding = EdgeInsets.all(10);
  static const Duration animationDuration = Duration(milliseconds: 200);

  static ThemeData lightThemeMode(String? family) {
    return ThemeData(
      fontFamily: family,
      useMaterial3: true,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Amiri",
          fontSize: 17,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
      ),
    );
  }

  static ThemeData darkThemeMode(String? family) {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: family,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: "Amiri",
          fontSize: 17,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
    );
  }

  static Color getSurfaceContainer(BuildContext context) {
    return ElevationOverlay.applySurfaceTint(
      context.colorScheme.surface,
      context.colorScheme.surfaceTint,
      3.0,
    );
  }
}
