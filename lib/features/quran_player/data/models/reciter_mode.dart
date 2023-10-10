import 'package:hear_quran/features/quran_player/domain/entities/reciter.dart';

class ReciterModel extends Reciter {
  const ReciterModel({
    required super.id,
    required super.imgPath,
    required super.enName,
    required super.arName,
    required super.audioUrl,
    required super.unAvailables,
  });

  factory ReciterModel.fromJson(Map<String, dynamic> json, int id) {
    return ReciterModel(
      id: id,
      imgPath: json["img"],
      enName: json["en"],
      arName: json["ar"],
      audioUrl: json["url"],
      unAvailables: List<int>.from(json["unAvailables"]),
    );
  }


}
