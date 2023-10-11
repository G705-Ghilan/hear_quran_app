import 'package:equatable/equatable.dart';

class Reciter extends Equatable {
  final int id;
  final String imgPath;
  final String en;
  final String ar;
  final String zh;
  final String audioUrl;
  final List<int> unAvailables;

  const Reciter({
    required this.id,
    required this.imgPath,
    required this.en,
    required this.ar,
    required this.zh,
    required this.audioUrl,
    required this.unAvailables,
  });

  @override
  List<Object?> get props => [id, imgPath, en, ar, zh, audioUrl, unAvailables];

  int get surahsCount => 114 - unAvailables.length;
  String getName(String lang) {
    switch (lang) {
      case "en":
        return en;
      case "ar":
        return ar;
      case "zh":
        return zh;
      default:
        return en;
    }
  }
}
