import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/general/general.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/hear_quran_app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await serviceLocator();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuranPlayerCubit()),
        BlocProvider(create: (context) => SettingsCubit()),
      ],
      child: const HearQuranApp(),
    ),
  );
}
