import 'dart:io';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/usecases/usecases.dart';
import 'package:just_audio/just_audio.dart';
import 'package:hear_quran/services/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';

class QuranPlayer {
  final AudioPlayer player = AudioPlayer();
  final Map<int, ConcatenatingAudioSource> sources = {};
  late final String cacheDir;
  late final String lang;
  int lastIndex = 0;
  late bool offline;
  bool isLastOffline = false;

  Future<void> setReciter(ReciterParams params) async {
    final bool isUninstalled = await setReciterPlaylist(params);
    final bool wasPlaying = player.playing;

    try {
      if (isUninstalled) {
        await player.stop();
      }
      await player.setAudioSource(
        sources[params.reciter.id]!,
        initialIndex: params.index ?? player.currentIndex,
        initialPosition: params.duration ?? Duration.zero,
      );
      if (isUninstalled && wasPlaying) {
        await play();
      }
    } catch (error, stackTrace) {
      logger.e(
        "Error when creating the play list",
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> init() async {
    final ReciterParams params = ReciterParams(
      reciter: DefualtBoxValues.reciter,
      index: DefualtBoxValues.lastSurah,
      duration: DefualtBoxValues.lastTime,
    );
    lang = DefualtBoxValues.locale.languageCode;

    // start the audio session
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());

    // setup the last audio settings and create the playlist
    offline = DefualtBoxValues.offlineMode;
    await player.setLoopMode(DefualtBoxValues.loopMode);
    if (DefualtBoxValues.shufle) {
      await player.shuffle();
    }
    player.setShuffleModeEnabled(DefualtBoxValues.shufle);
    await setReciter(params);
  }

  Future<void> initCacheDir() async {
    Directory? directory = await getExternalStorageDirectory();
    cacheDir = directory?.path ?? "/sdcard/Quran listen";
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest2<Duration, Duration?, PositionData>(
          player.positionStream, player.durationStream,
          (position, reportedDuration) {
        final duration = reportedDuration ?? Duration.zero;
        final bufferedPosition = player.bufferedPosition;

        return PositionData(position, bufferedPosition, duration);
      });

  File externalSurah(String name, int id) {
    return File(
      '$cacheDir/$name/${"0" * (3 - id.toString().length)}$id.mp3',
    );
  }

  Future<void> pause() async => await player.pause();
  Future<void> play() async {
    if (player.processingState == ProcessingState.idle) {
      await player.setAudioSource(
        sources[lastIndex]!,
        initialIndex: player.currentIndex,
      );
    }
    await player.play();
  }

  Future<void> switchPlaying() async {
    if (player.playing) {
      await pause();
    } else {
      await play();
    }
  }

  Future<void> seekIndex(int index) async {
    await player.seek(Duration.zero, index: index);
  }


  // return true if the last selected surah from the last playlist is unInstalled
  // to handle the new playlist exceptions
  // and create the playlist to sources value
  Future<bool> setReciterPlaylist(ReciterParams params) async {
    final Reciter reciter = params.reciter;
    lastIndex = reciter.id;
    bool isUninstalledSurahSelected = false;
    final List<Surah> surahs = sl<GetReciterSurahs>()(reciter.id);
    if (sources[reciter.id] == null) {
      sources[reciter.id] =
          ConcatenatingAudioSource(children: [], useLazyPreparation: true);
      for (final (index, surah) in surahs.indexed) {
        final int id = surah.id;

        final File surahFile = externalSurah(reciter.en, id);
        final tag = MediaItem(
          id: index.toString(),
          title: reciter.getName(lang),
          artist: surah.getName(lang),
        );

        if (surahFile.existsSync()) {
          await sources[reciter.id]!.add(AudioSource.file(
            surahFile.path,
            tag: tag,
          ));
        } else {
          if (index == (params.index ?? player.currentIndex)) {
            isUninstalledSurahSelected = true;
          }
          await sources[reciter.id]!.add(
            offline
                ? AudioSource.asset(
                    "assets/audio/empty.mp3",
                    tag: tag,
                  )
                : LockCachingAudioSource(
                    Uri.parse(
                      '${reciter.audioUrl}/${"0" * (3 - id.toString().length)}$id.mp3',
                    ),
                    index: index,
                    cacheFile: surahFile,
                    tag: tag,
                  ),
          );
        }
      }
    } else {
      final File surahFile = externalSurah(
          reciter.en, surahs[(params.index ?? player.currentIndex)!].id);
      isUninstalledSurahSelected == !surahFile.existsSync();
    }
    return isUninstalledSurahSelected;
  }

  Future<void> setOffline(bool mode, Reciter reciter) async {
    offline = mode;
    sources.clear();
    await setReciter(ReciterParams(
      reciter: reciter,
      index: player.currentIndex,
      duration: player.position,
    ));
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}

class ReciterParams {
  final Reciter reciter;
  final int? index;
  final Duration? duration;
  ReciterParams({required this.reciter, this.index, this.duration});
}
