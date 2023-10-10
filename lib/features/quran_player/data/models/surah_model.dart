import 'package:hear_quran/features/quran_player/domain/entities/surah.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.id,
    required super.arName,
    required super.enName,
    required super.verses,
  });

  factory SurahModel.fromJson(Map<String, dynamic> json, int id) {
    return SurahModel(
      id: id,
      arName: json["ar"],
      enName: json["en"],
      verses: json["verses"],
    );
  }


}
