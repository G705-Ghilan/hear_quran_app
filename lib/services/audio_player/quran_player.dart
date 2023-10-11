import 'dart:io';
import 'package:hear_quran/dependencies_injection.dart';
import 'package:hear_quran/features/quran_player/domain/entities/entities.dart';
import 'package:hear_quran/features/quran_player/domain/usecases/usecases.dart';
import 'package:hear_quran/services/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:audio_session/audio_session.dart';

class QuranPlayer {
  final AudioPlayer player = AudioPlayer();
  final Map<int, List<AudioSource>> sources = {};
  late final String cacheDir;
  late final String lang;
  int lastIndex = 0;
  late bool offline;

  Future<void> setReciter(ReciterParams params) async {
    await setReciterPlaylist(params.reciter);
    try {
      await player.setAudioSource(
        ConcatenatingAudioSource(children: sources[params.reciter.id]!),
        initialIndex: params.index ?? player.currentIndex,
        initialPosition: params.duration ?? Duration.zero,
      );
    } catch (error, stackTrace) {
      logger.e(
        "Error when creating the play list",
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> init(ReciterParams params, String lang) async {
    this.lang = lang;
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    offline = DefualtBoxValues.offlineMode;

    player.setLoopMode(DefualtBoxValues.loopMode);
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
        ConcatenatingAudioSource(children: sources[lastIndex]!),
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

  Future<void> setReciterPlaylist(Reciter reciter) async {
    lastIndex = reciter.id;
    final List<Surah> surahs = sl<GetReciterSurahs>()(reciter.id);

    if (sources[reciter.id] == null) {
      sources[reciter.id] = [];
      for (final (index, surah) in surahs.indexed) {
        final int id = surah.id;

        final File surahFile = externalSurah(reciter.en, id);
        final tag = MediaItem(
          id: index.toString(),
          title: reciter.getName(lang),
          artist: surah.getName(lang),
        );

        if (surahFile.existsSync()) {
          sources[reciter.id]!.add(AudioSource.file(
            surahFile.path,
            tag: tag,
          ));
        } else {
          sources[reciter.id]!.add(
            offline
                ? AudioSource.asset(
                    "assets/audio/empty.mp3",
                    tag: tag,
                  )
                : LockCachingAudioSource(
                    Uri.parse(
                      '${reciter.audioUrl}/${"0" * (3 - id.toString().length)}$id.mp3',
                    ),
                    cacheFile: surahFile,
                    tag: tag,
                  ),
          );
        }
      }
    }
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
