import 'package:equatable/equatable.dart';

class Reciter extends Equatable {
  final int id;
  final String imgPath;
  final String enName;
  final String arName;
  final String audioUrl;
  final List<int> unAvailables;

  const Reciter({
    required this.id,
    required this.imgPath,
    required this.enName,
    required this.arName,
    required this.audioUrl,
    required this.unAvailables,
  });

  @override
  List<Object?> get props =>
      [id, imgPath, enName, arName, audioUrl, unAvailables];

  int get surahsCount => 114 - unAvailables.length;
  String getName(String lang) => lang == "en" ? enName : arName;
}
