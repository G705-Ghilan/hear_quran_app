import 'package:get_it/get_it.dart';
import 'package:hear_quran/features/general/general.dart';
import 'package:hear_quran/features/quran_player/data/datasource/quran_local_datasource.dart';
import 'package:hear_quran/features/quran_player/data/repository/quran_repository_impl.dart';
import 'package:hear_quran/features/quran_player/domain/repository/quran_repository.dart';
import 'package:hear_quran/features/quran_player/domain/usecases/usecases.dart';
import 'package:hear_quran/features/quran_player/presentation/cubit/quran_player_cubit.dart';
import 'package:hear_quran/services/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:logger/logger.dart';

final GetIt sl = GetIt.instance;
final logger = Logger();

Future<void> serviceLocator() async {
  // repositories
  sl.registerLazySingleton<QuranRepository>(() => QuranRepositoryImpl(sl()));

  // datasources
  final datasource = await QuranLocalDataSourceImpl()();
  sl.registerLazySingleton<QuranLocalDataSource>(() => datasource);

  // usecases
  sl.registerLazySingleton(() => GetReciterSurahs(sl()));
  sl.registerLazySingleton(() => GetReciters(sl()));

  // others
  _blocsAndCubits();
  await _services();
}

void _blocsAndCubits() {
  sl.registerLazySingleton<QuranPlayerCubit>(() => QuranPlayerCubit());
  sl.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}

Future<void> _services() async {
  // background quran playing service
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Quran playback',
    androidNotificationOngoing: true,
  );

  // permissions handler
  await PermissionsHandler.initlizeHandler();

  // Main box
  await MainBox.initilazieMainBox();

  // Quran player
  final QuranPlayer player = QuranPlayer();
  sl.registerLazySingleton<QuranPlayer>(() => player);

  if (PermissionsHandler.filesAllowed) {
    await player.initCacheDir();
    await player.init(
      ReciterParams(
        reciter: DefualtBoxValues.reciter,
        index: 0,
        duration: DefualtBoxValues.lastTime,
      ),
      DefualtBoxValues.locale.languageCode,
    );
  } else {
    await player.initCacheDir();
  }
}
