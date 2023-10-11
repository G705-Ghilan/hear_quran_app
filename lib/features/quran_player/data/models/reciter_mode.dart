import 'package:hear_quran/features/quran_player/domain/entities/reciter.dart';

class ReciterModel extends Reciter {
  const ReciterModel({
    required super.id,
    required super.imgPath,
    required super.en,
    required super.ar,
    required super.zh,
    required super.audioUrl,
    required super.unAvailables,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json, int id) {
    return ReciterModel(
      id: id,
      imgPath: json["img"],
      en: json["en"],
      ar: json["ar"],
      zh: json["zh"],
      audioUrl: json["url"],
      unAvailables: List<int>.from(json["unAvailables"]),
    );
  }


}
